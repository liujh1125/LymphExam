//
//  Utils.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/26.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

class Utils: NSObject {

    // 安全转换字符串
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
    
    // 校验手机号码的合法性
    static func isTelNumber(num:NSString)->Bool {
        
        let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let  CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
        let  CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
        let  CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluate(with: num) == true)
            || (regextestcm.evaluate(with: num)  == true)
            || (regextestct.evaluate(with: num) == true)
            || (regextestcu.evaluate(with: num) == true))
        {
            return true
        }
        else
        {
            return false
        }  
    }
    
    // 校验手机号码
    static func isTelNumber2(regString: String)->Bool{
        
        let expression = "^1[3|4|5|7|8][0-9]{9}$"  // 最新手机号码正则表达式含177、147、170号段
        let regex = try! NSRegularExpression(pattern: expression, options: NSRegularExpression.Options.allowCommentsAndWhitespace)
        let numberOfMatches = regex.numberOfMatches(in: regString, options:NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, (regString as NSString).length))
        
        return numberOfMatches != 0
    }

    
    // 校验金额输入
    static func isMoneyNumber(regString: String)->Bool{
        
        let expression = "^[0-9]*((\\.|,)[0-9]{0,2})?$"
        let regex = try! NSRegularExpression(pattern: expression, options: NSRegularExpression.Options.allowCommentsAndWhitespace)
        let numberOfMatches = regex.numberOfMatches(in: regString, options:NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, (regString as NSString).length))
        
        return numberOfMatches != 0
    }
    
    
    // 校验是否全部是数字
    static func isNumber(regString: String)->Bool{
        
        let expression = "^[0-9]*$"
        let regex = try! NSRegularExpression(pattern: expression, options: NSRegularExpression.Options.allowCommentsAndWhitespace)
        let numberOfMatches = regex.numberOfMatches(in: regString, options:NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, (regString as NSString).length))
        
        return numberOfMatches != 0
    }
    
    
    
}
