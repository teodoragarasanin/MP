//
//  DropItView.swift
//  DropItApp
//
//  Created by Teodora on 1/14/17.
//  Copyright © 2017 Teodora. All rights reserved.
//

import UIKit

class DropItView: UIView, UIDynamicAnimatorDelegate {

    private let dropBehavior = FallingObjectBehavior()
    
    private lazy var animator: UIDynamicAnimator = {
       let animator = UIDynamicAnimator(referenceView: self)
        animator.delegate = self
        return animator
    }()
    
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
        removeCompleteRow()
    }
    
    var animating: Bool = false {
        didSet {
            if animating {
                animator.addBehavior(dropBehavior)
                animator.addBehavior(dropBehavior)
            } else {
                animator.removeBehavior(dropBehavior)
                animator.removeBehavior(dropBehavior)

            }
        }
        
    }
    
    private let dropsPerRow = 10
    
    private var dropSize: CGSize {
        let size = bounds.size.width/CGFloat(dropsPerRow)
        return CGSize(width: size, height: size)
    }
    
    
    func addDrop() {
        
        var frame = CGRect(origin:CGPoint.zero, size:dropSize)
        frame.origin.x = CGFloat.random(max: dropsPerRow)*dropSize.width
        
        let drop = UIView(frame: frame)
        drop.backgroundColor = UIColor.random
        
        addSubview(drop)
        dropBehavior.addItem(item: drop)
        dropBehavior.addItem(item: drop)
        
    }
    
   /*
    private func removeCompleteRow () {
        
        var dropsToRemove = [UIView]()
        
        var hitTestRect = CGRect(origin: bounds.lowerLeft, size: dropSize)
        
       repeat {
            hitTestRect.origin.x = bounds.midX
            hitTestRect.origin.y = hitTestRect.origin.y - dropSize.height
            var dropsTested = 0
            var dropsFound = [UIView]()
            
            while dropsTested < dropsPerRow {
                if let hitView = hitTest(p: hitTestRect.mid)   { //, hitView.superview == self
                    dropsFound.append(hitView)
                }
                
                hitTestRect.origin.x = hitTestRect.origin.x + dropSize.width
                dropsTested = dropsTested + 1
                print("\(dropsTested)")
            }
            
            if dropsTested == dropsPerRow {
                dropsToRemove = dropsToRemove + dropsFound
                print("\(dropsToRemove.count)")
            }
        } while dropsToRemove.count == 0 && hitTestRect.origin.y > bounds.midY
    
        for drop in dropsToRemove {
            dropBehavior.removeItem(item: drop)
            drop.removeFromSuperview()
            print("\(dropsToRemove.count)")
            
        }
    }
    
 */
    
    
    
    private func removeCompleteRow () {
    
        
    
    let yCenterOfBottomView = self.bounds.height - (dropSize.height / 2.0)
    let xStartPoint = dropSize.width / 2.0
    let xEndPoint = self.bounds.width
    
    var viewsToRemove = [UIView]()
    
    for x in stride (from: xStartPoint, to: xEndPoint, by: dropSize.width) {
        
        if let topViewInPosition = self.hitTest(CGPoint(x: x, y: yCenterOfBottomView), with: nil) {
                if topViewInPosition.bounds.size != dropSize {
                    break
                }
    
            viewsToRemove.append(topViewInPosition)
        }
    }
    
    if viewsToRemove.count != dropsPerRow {
        return
    }
    
    for view in viewsToRemove {
   
        dropBehavior.removeItem(item: view)
        view.removeFromSuperview()
    }

}

    
    


}
