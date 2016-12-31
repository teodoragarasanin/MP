//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Teodora on 12/30/16.
//  Copyright © 2016 Teodora. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    
    enum Operation: String {
        
        case Divide =  "/"
        case Multiply = "*"
        case Substract = "-"
        case Add = "+"
        case Empty = ""
    }
   
    var currentOperation = Operation.Empty
    var leftVarStr = ""
    var rightVarStr = ""
    var result = ""
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource:"btn",ofType:"wav")
        let soundURL = URL(fileURLWithPath:path!)
        
        do{
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        }catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    @IBAction func onDividePressed (sender: AnyObject){
        processOperation(operation: .Divide)
        
    }
    @IBAction func onMultiplyPressed (sender: AnyObject){
        
        processOperation(operation: .Multiply)

    }
    @IBAction func onSubstractPressed (sender: AnyObject){
        
        processOperation(operation: .Substract)

    }
    @IBAction func onAddPressed (sender: AnyObject){
        processOperation(operation: .Add)

        
    }
    
    @IBAction func onEqualPressed (sender: AnyObject){
        processOperation(operation: currentOperation)
        
        
    }
    
    
    @IBAction func numberPressed(sender: UIButton) {
        
        playSound()
        
        runningNumber+="\(sender.tag)"
        outputLabel.text = runningNumber
    }

    func playSound() {
        
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }

    func processOperation(operation: Operation){
        
        if currentOperation != Operation.Empty {
            
            if runningNumber != "" {
                
                rightVarStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftVarStr)! * Double(rightVarStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftVarStr)! / Double(rightVarStr)!)"
                } else if currentOperation == Operation.Substract{
                    result = "\(Double(leftVarStr)! - Double(rightVarStr)!)"
                } else if currentOperation == Operation.Add{
                    result = "\(Double(leftVarStr)! + Double(rightVarStr)!)"
                }
                leftVarStr = result
                outputLabel.text = result
            }
            currentOperation = operation
        } else {
            
            leftVarStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
}

