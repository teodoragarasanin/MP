//
//  ViewController.swift
//  ScrollView
//
//  Created by Teodora on 12/30/16.
//  Copyright © 2016 Teodora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var images = [UIImageView]()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...2 {
            
            let image = UIImage(named:"icon\(i).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
        
        }
        
        
    }


}

