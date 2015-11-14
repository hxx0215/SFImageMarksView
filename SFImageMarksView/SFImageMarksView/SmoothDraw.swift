//
//  SmoothDraw.swift
//  SFImageMarksView
//
//  Created by shadowPriest on 15/11/11.
//
//

import UIKit

class SmoothDraw: UIView {

    let path = UIBezierPath()
    var previousPoint1 = CGPointZero
    var previousPoint2 = CGPointZero
    var currentPoint = CGPointZero
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else{
            return;
        }
        self.previousPoint1 = touch.previousLocationInView(self)
        self.currentPoint = touch.locationInView(self)
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
}
