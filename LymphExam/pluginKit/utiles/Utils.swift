//
//  Utils.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/26.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

class Utils: NSObject {

    static func StringValue(str:Any)->String{
        var strVal = "\(str)"
        if strVal.components(separatedBy: "nil").count > 1 {
            return ""
        }
        if strVal.components(separatedBy: "null").count > 1 {
            return ""
        }
        strVal = strVal.replacingOccurrences(of: "\"", with: "")
        strVal = strVal.replacingOccurrences(of: " ", with: "")
        
        return strVal
    }
    
    
}
