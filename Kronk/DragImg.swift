//
//  DragImg.swift
//  Kronk
//
//  Created by H on 5/23/16.
//  Copyright © 2016 H. All rights reserved.
//

import Foundation
import UIKit

class DragImg: UIImageView {
    
    var originalPosition: CGPoint!
    var dropTarget: UIView?
    
    // UIView? with a question mark b/c user may have dragged
    // heart or food somewhere other than on Kronk-- i.e. 
    // there may not be a target
    
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y)
            
        }
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // want to check if we have dropped the heart or food over the target(Kronk)
        
        if let touch = touches.first, let target = dropTarget {
            
            // if there was a touch (true) and the item is over the target (true)
            
            let position = touch.locationInView(self.superview)
            // gets the position of where the user let go
            
            if CGRectContainsPoint(target.frame, position) {
                
                // if the position is in the target.frame (Kronk) is true
                // notify the view controller so it knows what to do next
                
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "onTargetDropped", object: nil))
            }
            
        }
        
        self.center = originalPosition
        
    }
}