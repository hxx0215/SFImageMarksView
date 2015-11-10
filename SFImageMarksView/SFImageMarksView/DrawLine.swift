//
//  DrawLine.swift
//  SFImageMarksView
//
//  Created by shadowPriest on 15/11/9.
//
//

import UIKit

enum DrawLinePosition {
    case Up
    case Down
}

protocol DrawLineDelegate : class{
    func shouldDraw(view: DrawLine)
}

class DrawLine: UIView {

    var path = UIBezierPath()
    var path2 = UIBezierPath()
    weak var delegate:DrawLineDelegate?
    
    lazy var position:DrawLinePosition = {
        return .Up
    }()
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineCap(context, .Round)
        CGContextSetLineJoin(context, .Round)
        CGContextSetLineWidth(context, 2.0)
        let color = UIColor.redColor()
        CGContextSetStrokeColorWithColor(context, color.CGColor)

        if position == .Up{
            CGContextAddPath(context, self.path.CGPath)
        }else{
            CGContextAddPath(context, self.path2.CGPath)
        }
        CGContextStrokePath(context)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let point = touches.first?.locationInView(self) {
            self.path.moveToPoint(point)
            self.path2.moveToPoint(point)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let e = event else{
            return;
        }
        guard let touch = touches.first else{
            return;
        }
        if let coalescedTouch = e.coalescedTouchesForTouch(touch){
            if let point = coalescedTouch.first?.locationInView(self){
                self.path.addLineToPoint(point)
            }
        }
        if let point = touches.first?.locationInView(self){
            self.path2.addLineToPoint(point)
        }
        if let del = self.delegate{
            del.shouldDraw(self)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let point = touches.first?.locationInView(self) {
            self.path.addLineToPoint(point)
            self.path2.addLineToPoint(point)
        }
        self.setNeedsDisplay()
    }
}
