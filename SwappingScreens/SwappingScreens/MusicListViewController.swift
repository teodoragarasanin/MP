//
//  MusicListViewController.swift
//  SwappingScreens
//
//  Created by Teodora on 12/30/16.
//  Copyright © 2016 Teodora. All rights reserved.
//

import UIKit

class MusicListViewController: UIViewController {

  
    
    
    @IBAction func load3rdScreenPressed(_ sender: Any) {
        
        let songTitle = "Quit Playing Games With My Heart"
        performSegue(withIdentifier: "SongVC", sender: songTitle)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlaySongViewController {
            
            if let song = sender as? String {
                
                destination.selectedSong = song

            }
        
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue
    }

}
