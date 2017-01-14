//
//  DropItViewController.swift
//  DropItApp
//
//  Created by Teodora on 1/14/17.
//  Copyright © 2017 Teodora. All rights reserved.
//

import UIKit

class DropItViewController: UIViewController {

    @IBOutlet weak var dropItView: DropItView! {
        
        didSet {
            
            dropItView.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(addDrop(recognizer:))))
        }
    }
    
    func addDrop(recognizer: UITapGestureRecognizer)  {
        
        if recognizer.state == .ended {
            dropItView.addDrop()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dropItView.animating = true
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dropItView.animating = false
    }
}
