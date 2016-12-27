//
//  UIViewExt.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/25.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    func setBorderWidth(width: Int, bordColor:UIColor) {
        self.layer.borderWidth = 1
        self.layer.borderColor = bordColor.cgColor
    }
    
    func setCornerRadius(radius: Int) {
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.masksToBounds = true
    }
    
    
    
    
}
