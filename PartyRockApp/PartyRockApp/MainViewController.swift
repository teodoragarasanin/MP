//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Teodora on 12/31/16.
//  Copyright © 2016 Teodora. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var partyRocks = [PartyRock]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let p1 = PartyRock(imageURL:"http://3.bp.blogspot.com/-Ue1BNDfjTwE/UPFybkYOckI/AAAAAAAACB0/SfkwREI3KHM/s640/A-Beautiful-Path-Villaviciosa-Asturias-Spain-700x525.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/XmwkjT9oO2E\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "First  Waltz")
        
           let p2 = PartyRock(imageURL:"http://3.bp.blogspot.com/-Ue1BNDfjTwE/UPFybkYOckI/AAAAAAAACB0/SfkwREI3KHM/s640/A-Beautiful-Path-Villaviciosa-Asturias-Spain-700x525.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/XmwkjT9oO2E\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Second Waltz")
        
          let p3 = PartyRock(imageURL:"http://s1.picswalls.com/wallpapers/2015/12/12/awesome-beautiful-wallpaper_124413582_294.jpg",videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/XmwkjT9oO2E\" frameborder=\"0\" allowfullscreen></iframe>",videoTitle: "Third Waltz")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)

       
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyRockTableViewCell", for: indexPath) as? PartyRockTableViewCell {
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
           
        } else {
        
        return UITableViewCell()
    }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }

}

