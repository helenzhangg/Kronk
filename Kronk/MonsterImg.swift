//
//  MonsterImg.swift
//  Kronk
//
//  Created by H on 5/23/16.
//  Copyright © 2016 H. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    required  init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation() // when app first loads play idle animation
    }
    
    func playIdleAnimation() {
        
        self.image = UIImage(named: "idle1.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage] ()
        for var x = 1; x <= 4; x++ {
            let img = UIImage(named: "idle\(x).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0 // 0 will make it loop infinitely (keep Kronk breathing)
        self.startAnimating()
    }
    
    func playDeathAnimation() {
        
        self.image = UIImage(named: "dead5.png") // sets a default image to the last dead frame
        
        self.animationImages = nil // resets the animation images after Kronk dies
        
        var imgArray = [UIImage] ()
        for var x = 1; x<=5; x++ {
            let img = UIImage(named: "dead\(x).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
        
    }
}


