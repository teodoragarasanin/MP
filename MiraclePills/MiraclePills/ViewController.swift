//
//  ViewController.swift
//  MiraclePills
//
//  Created by Teodora on 12/14/16.
//  Copyright © 2016 Teodora. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //MARK: Outlets
    
    @IBOutlet weak var statePicker: UIPickerView!
    
    @IBOutlet weak var stateButton: UIButton!
   
    //MARK: Properties
    
    let states = ["Alaska", "California", "New York"]
    
    //MARK: Actions
    
    @IBAction func chooseStateButtonTapped(_ sender: UIButton) {
        
        statePicker.isHidden = false
        
    }
    
    //MARK: UIPickerViewDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        stateButton.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
    }
    
    
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }


}

