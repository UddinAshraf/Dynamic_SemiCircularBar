//
//  PayUpperTransparentViewController.swift
//  Financial App
//
//  Created by BS126 on 11/7/18.
//  Copyright © 2018 BS23. All rights reserved.
//

import Foundation
import  UIKit
class UpperTransparentView: UIView {
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.isOpaque = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func draw(_ rect: CGRect) {
        self.createBakaLine()
        UIColor.hexStringToUIColor(hex: "10579B").withAlphaComponent(0.1).setFill()
        path.fill()
    }
    
    func createBakaLine() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height - 160))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        path.close()
    }
}
