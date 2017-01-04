//
//  ViewController.swift
//  VoiceRecognizerApp
//
//  Created by Teodora on 1/3/17.
//  Copyright © 2017 Teodora. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController, SFSpeechRecognizerDelegate {

    //MARK: Outlets
    
    @IBOutlet weak var microphoneButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textLabel: UILabel!
    
    //MARK: Properties
    
    private let speechRecognizer = SFSpeechRecognizer (locale: Locale.init(identifier: "en-US"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private var audioEngine = AVAudioEngine()
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        microphoneButton.isEnabled = false
        speechRecognizer?.delegate = self
        
        SFSpeechRecognizer.requestAuthorization{ (authStatus) in
            
            var isButtonEnabled = false
            
            switch authStatus {
                
            case .authorized:
                isButtonEnabled = true
            case .denied:
                isButtonEnabled = false
                print("User denied access to speech recognizer")
            case .restricted:
                isButtonEnabled = false
                print("Speech recognition restricted on this device")
            case .notDetermined:
                isButtonEnabled = false
                print("Speech recognition not yet authorized")
                
            }
            
            OperationQueue.main.addOperation(){
                self.microphoneButton.isEnabled = isButtonEnabled
            }
            
        }
        
        
    }

    //MARK: Actions
    
    @IBAction func microphoneTapped(_ sender: Any) {
        
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
            microphoneButton.isEnabled = false
            microphoneButton.setTitle("Start Recording", for: .normal)
        } else {
            startRecording()
            microphoneButton.setTitle("Stop Recording", for: .normal)
        }
    }

    //MARK: Recording methods
    
    func startRecording() {
        
        
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask=nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        do{
            try audioSession.setCategory(AVAudioSessionCategoryRecord)
            try audioSession.setMode(AVAudioSessionModeMeasurement)
            try audioSession.setActive(true, with: .notifyOthersOnDeactivation)
        }catch {
            print("audioSession properties weren't set because of an error")
        }
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        guard let inputNode = audioEngine.inputNode else {
            fatalError("Audio engine has no input node")
            
        }
        
        guard let recognitionRequest = recognitionRequest else {
            
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        }
        
        recognitionRequest.shouldReportPartialResults = true
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler:{(result, error) in
            
            var isFinal = false
            if result != nil {
                
                self.textView.text = result?.bestTranscription.formattedString
                isFinal = (result?.isFinal)!
            }
            
            if error != nil || isFinal {
               self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                
                self.microphoneButton.isEnabled = true
                
            }
        } )
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat)  {(buffer, when) in
       
            self.recognitionRequest?.append(buffer)
            
        }
        
        audioEngine.prepare()
        
        do{
            try audioEngine.start()
            
        } catch {
            
            print("audioEngine couldn't start because of an error.")
        }
        
        textView.text = "Say something, I'm listening!"
    }
    
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            microphoneButton.isEnabled = true
        } else {
            microphoneButton.isEnabled = false
        }
    }
    
}

