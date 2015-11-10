//
//  ViewController.swift
//  SFImageMarksView
//
//  Created by shadowPriest on 15/11/6.
//
//

import UIKit

class ViewController: UIViewController,DrawLineDelegate {

    @IBOutlet weak var lineView1: DrawLine!
    @IBOutlet weak var lineView2: DrawLine!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lineView1.position = .Up
        lineView2.position = .Down
        lineView1.delegate = self
        lineView2.delegate = self
    }

    func shouldDraw(view: DrawLine) {
        if view == lineView1{
            lineView2.path2 = lineView1.path2
            lineView2.path = lineView1.path
        }else{
            lineView1.path = lineView2.path
            lineView1.path2 = lineView2.path2
        }
        lineView1.setNeedsDisplay()
        lineView2.setNeedsDisplay()
    }

}

