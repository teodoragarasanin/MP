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
        
    }

}
