//
//  PartyRockTableViewCell.swift
//  PartyRockApp
//
//  Created by Teodora on 1/4/17.
//  Copyright © 2017 Teodora. All rights reserved.
//

import UIKit

class PartyRockTableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateUI(partyRock: PartyRock) {
       
        cellLabel.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    
                    self.cellImageView.image = UIImage(data:data)
                }
            } catch  {
                //handle the error
            }
        }
    }

}
