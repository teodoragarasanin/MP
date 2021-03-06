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
    
    private let itemBehavior: UIDynamicItemBehavior = {
        let dib = UIDynamicItemBehavior ()
        dib.allowsRotation = true
        dib.elasticity = 0.0
        return dib
    }()
    
    
    func addBarrier(path: UIBezierPath, named name: String){
        collider.removeBoundary(withIdentifier: name as NSCopying) // ?? NSCopying
        collider.addBoundary(withIdentifier: name as NSCopying, for: path)
        
        
    }
    
  
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(itemBehavior)
    }
    
    func addItem (item: UIDynamicItem) {
        gravity.addItem(item)
        collider.addItem(item)
        itemBehavior.addItem(item)
    }
    
    func removeItem (item: UIDynamicItem) {
        gravity.removeItem(item)
        collider.removeItem(item)
        itemBehavior.removeItem(item)
    }
}
