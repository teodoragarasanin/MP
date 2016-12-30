//
//  PlaySongViewController.swift
//  SwappingScreens
//
//  Created by Teodora on 12/30/16.
//  Copyright © 2016 Teodora. All rights reserved.
//

import UIKit

class PlaySongViewController: UIViewController {

    private var _selectedSong: String!
    
    var selectedSong: String {
        
        get {
            return _selectedSong
        }
        set {
            _selectedSong = newValue
        }
        
    }
    
    
    
    @IBOutlet weak var songTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songTitleLabel.text = _selectedSong

    }

  

}
