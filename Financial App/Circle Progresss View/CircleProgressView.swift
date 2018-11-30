//
//  CircleProgressView.swift
//  Financial App
//
//  Created by BS126 on 11/8/18.
//  Copyright © 2018 BS23. All rights reserved.
//

import Foundation
import UIKit

class CircleProgressView: UIView {
    
    var progress: Float = 0 {
        
        willSet(newValue) {
            progressLayer.strokeEnd = CGFloat(newValue)
        }
    }
    var bgPath: UIBezierPath!
    var shapeLayer: CAShapeLayer!
    var progressLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //bgPath = UIBezierPath()
        //self.circleProgressBarShape()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        bgPath = UIBezierPath()
        self.circleProgressBarShape()
    }
    
    private func createSemiCircle() {
        let x = self.bounds.size.width / 2
        //let y = 0.0
        let center = CGPoint(x: x, y: 0)
        bgPath.addArc(withCenter: center, radius:  x - 50, startAngle: CGFloat(0), endAngle: CGFloat(6.28), clockwise: true)
        bgPath.close()
    }
    
    func circleProgressBarShape() {
        createSemiCircle()
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = bgPath.cgPath
        shapeLayer.lineWidth =  30
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.hexStringToUIColor(hex: "C3D5E7").cgColor
        
        progressLayer = CAShapeLayer()
        progressLayer.path = bgPath.cgPath
        progressLayer.lineWidth = 30
        progressLayer.lineCap = CAShapeLayerLineCap.round
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.hexStringToUIColor(hex: "296BAA").cgColor
        progressLayer.strokeEnd = 0.0
        
        self.layer.addSublayer(shapeLayer)
        self.layer.addSublayer(progressLayer)
    }
}
