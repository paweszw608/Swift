//
//  FaceView.swift
//
//  Created by Lab PUM on 30.10.2015.
//  Copyright © 2015 PS. All rights reserved.
//

import UIKit

class FaceView: UIView {

    var red = CGFloat(1.0)
    var blue = CGFloat(1.0)
    var green = CGFloat(1.0)
    
    var smileValue = CGFloat(1.0)
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // colorsValues:
        
        // Drawing code
        let bounds:CGRect = self.bounds
        
        var midPoint=CGPoint() // center of our bounds in our coordinate system
        midPoint.x = bounds.origin.x + bounds.size.width/2
        midPoint.y = bounds.origin.y + bounds.size.height/2
        
     
        var point=CGPoint()
        point.x = midPoint.x
        point.y = midPoint.y
        
        var point1 = CGPoint() // left eye
        point1.x = midPoint.x - 40
        point1.y = midPoint.y - 40
        
        var point2 = CGPoint() // right eye
        point2.x = midPoint.x + 40
        point2.y = midPoint.y - 40
        
        var currentPointSmile = CGPoint()
        currentPointSmile.x = midPoint.x - 50
        currentPointSmile.y = midPoint.y + 50
        
        var endPointSmile = CGPoint()
        endPointSmile.x = midPoint.x + 50
        endPointSmile.y = midPoint.y + 50
        
        var controlPointSmile = CGPoint()
       
        controlPointSmile.x = midPoint.x
        controlPointSmile.y =  endPointSmile.y + smileValue
        
        let path:UIBezierPath=UIBezierPath()
        path.addArc(withCenter: point, radius: 110, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
        path.lineWidth=10
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        color.setFill()
        path.stroke()
        path.fill()

        
        let path1:UIBezierPath=UIBezierPath()
        path1.addArc(withCenter: point1, radius: 15, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
        UIColor.white.setFill()
        path1.lineWidth=10
        path1.stroke()
        path1.fill()
        
        let path2:UIBezierPath=UIBezierPath()
        path2.addArc(withCenter: point2, radius: 15, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
        UIColor.white.setFill()
        path2.lineWidth=10
        path2.stroke()
        path2.fill()
        
        let path3:UIBezierPath=UIBezierPath()
        path3.move(to: currentPointSmile)
        path3.addQuadCurve(to: endPointSmile, controlPoint: controlPointSmile)
        path3.lineWidth = 5
        path3.stroke()
        
        
  
    }
    

}
