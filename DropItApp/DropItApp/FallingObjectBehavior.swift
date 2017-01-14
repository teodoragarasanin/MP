//
//  FallingObjectBehavior.swift
//  DropItApp
//
//  Created by Teodora on 1/14/17.
//  Copyright © 2017 Teodora. All rights reserved.
//

import UIKit

class FallingObjectBehavior: UIDynamicBehavior {

    private let gravity = UIGravityBehavior()
    private let collider: UICollisionBehavior = {
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        return collider
    }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
    }
    
    func addItem (item: UIDynamicItem) {
        gravity.addItem(item)
        collider.addItem(item)
    }
    
    func removeItem (item: UIDynamicItem) {
        gravity.removeItem(item)
        collider.removeItem(item)
    }
}
