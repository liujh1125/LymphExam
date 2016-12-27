//
//  ActivityLoadingView.swift
//  KFDoctor
//
//  Created by ehmo on 2016/12/15.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

class ActivityLoadingView: UIView {

    public var animating: Bool { return isAnimating }
    public private(set) var isAnimating: Bool = false
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.speed = 1
        isHidden = true
        self.backgroundColor = RGBA(r: 0, g: 0, b: 0, a: 0.6)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
    }
    
    public final func startAnimating() {
        isHidden = false
        isAnimating = true
        layer.speed = 1
        setUpAnimation()
    }
    
    public final func stopAnimating() {
        isHidden = true
        isAnimating = false
        layer.sublayers?.removeAll()
    }
    
    private final func setUpAnimation() {
        
        

        let layerRect = CGRect(x: (self.bounds.size.width-20)/2, y: (self.bounds.size.height-20)/2, width: 20, height: 20)
        let layerView = UIView(frame: layerRect)
        self.addSubview(layerView)
        

        let size = layerRect.size
        
        let duration: CFTimeInterval = 3
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.09, 0.57, 0.49, 0.9)
        
        // Animation
        let animation = CAKeyframeAnimation(keyPath: "transform")
        
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.timingFunctions = [timingFunction, timingFunction, timingFunction, timingFunction]
        animation.values = [
            NSValue(caTransform3D: CATransform3DConcat(createRotateXTransform(angle: 0), createRotateYTransform(angle: 0))),
            NSValue(caTransform3D: CATransform3DConcat(createRotateXTransform(angle: CGFloat(M_PI)), createRotateYTransform(angle: 0))),
            NSValue(caTransform3D: CATransform3DConcat(createRotateXTransform(angle: CGFloat(M_PI)), createRotateYTransform(angle: CGFloat(M_PI)))),
            NSValue(caTransform3D: CATransform3DConcat(createRotateXTransform(angle: 0), createRotateYTransform(angle: CGFloat(M_PI)))),
            NSValue(caTransform3D: CATransform3DConcat(createRotateXTransform(angle: 0), createRotateYTransform(angle: 0)))]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw square
        let square = NVActivityIndicatorShape.rectangle.layerWith(size: size, color: RGBA(r: 255, g: 255, b: 255, a: 1))
        let frame = CGRect(x: (layerView.layer.bounds.size.width - size.width) / 2,
                           y: (layerView.layer.bounds.size.height - size.height) / 2,
                           width: size.width,
                           height: size.height)
        
        square.frame = frame
        square.add(animation, forKey: "animation")
        layerView.layer.addSublayer(square)
        
    }
    
    
    func createRotateXTransform(angle: CGFloat) -> CATransform3D {
        var transform = CATransform3DMakeRotation(angle, 1, 0, 0)
        
        transform.m34 = CGFloat(-1) / 100
        
        return transform
    }
    
    func createRotateYTransform(angle: CGFloat) -> CATransform3D {
        var transform = CATransform3DMakeRotation(angle, 0, 1, 0)
        
        transform.m34 = CGFloat(-1) / 100
        
        return transform
    }
    
    
    
}
