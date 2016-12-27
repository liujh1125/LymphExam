//
//  configuration.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/25.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import Foundation
import UIKit

let BASEURL = "http://101.201.103.170:8083/"



let ExitLoginOut = "UserExitLoginNotification"      // 用户退出登录通知
let LoginSuccess = "UserLoginSuccessNotification"   // 用户登录成功通知

let WIDTH = UIScreen.main.bounds.size.width         //屏幕宽
let HEIGHT = UIScreen.main.bounds.size.height       //屏幕高

let COLOR_MAIN = UIColor.init(colorLiteralRed: 102/255.0, green: 179/255.0, blue: 48/255.0, alpha: 1)


func RGBA(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor{
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}


func RGB(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor{
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}


