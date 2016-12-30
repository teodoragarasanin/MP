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
        
        
    }


    
    override func viewDidAppear(_ animated: Bool) {
        
        var contentWidth:CGFloat = 0.0
        
        for i in 0...2 {
            
            let image = UIImage(named:"icon\(i).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            newX = scrollView.frame.size.width/2 + scrollView.frame.size.width * CGFloat(i)
            contentWidth+=newX
            scrollView.addSubview(imageView)
            
            imageView.frame = CGRect(x:newX-75, y:(view.frame.size.height/2)-75, width:150, height:150)
            
        }
        
        //scrollView.backgroundColor = UIColor.purple
        
        scrollView.contentSize = CGSize(width:contentWidth, height: view.frame.size.height)
        //scrollView.clipsToBounds = false
        
        
        
    }
}

