//
//  HttpRequest.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/25.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit
import Alamofire


typealias Success = (_ result:Any)->Void
typealias Failure = (_ error:Any)->Void


class HttpRequest: NSObject {
    
    
    static func alamofirePost(urlString:String,paramet: Dictionary<String, Any>, success:@escaping Success, failure:@escaping Failure){
        
        var newUrlString = urlString
        if urlString.components(separatedBy: BASEURL).count <= 1 {
            newUrlString = BASEURL + urlString
        }
        
        let headers: HTTPHeaders = [:]
        Alamofire.request(newUrlString, method: .get, parameters: paramet, encoding: JSONEncoding.prettyPrinted, headers: headers).responseJSON { response in
            
            print("请求：" + (response.request?.url?.absoluteString)!)  // original URL request
            print("响应：\(response.result) \n \((response.response)!) ") // HTTP URL response
            
            let code =   response.response?.statusCode
            if code == 200 {
                print("返回：\((response.result.value)!)")   // result of response serialization
                
                if let JSON = response.result.value {
                    let rspDt = JSON as! Dictionary<String,Any>

                    if let resCode = rspDt["resCode"] {
                        let code = Utils.StringValue(str: resCode)
                        if code == "1" {
                            success(JSON as Any)
                        }else{
                            failure(["code":"2","message":"后台返回错误"])
                        }
                    }else{
                        failure(["code":"2","message":"返回数据格式错误"])
                    }
                }
            }else{
                failure(["code":"\(code!)","message":"请求失败"])
            }
        }
        
    }
    static func alamofireGet(urlString:String,paramet: Dictionary<String, Any>, success:@escaping Success, failure:@escaping Failure){
        
        let newUrlString = "\(BASEURL)\(urlString)"
        
        let headers: HTTPHeaders = [:]
        Alamofire.request(newUrlString, method: .get, parameters: paramet, encoding: JSONEncoding.prettyPrinted, headers: headers).responseJSON { response in
            
            print("请求：" + (response.request?.url?.absoluteString)!)  // original URL request
            print("响应：\(response.result) \n \((response.response)!) ") // HTTP URL response
            
            let code =   response.response?.statusCode
            if code == 200 {
                print("返回：\((response.result.value)!)")   // result of response serialization
                
                if let JSON = response.result.value {
                    let rspDt = JSON as! Dictionary<String,Any>
                    
                    if let resCode = rspDt["resCode"] {
                        let code = Utils.StringValue(str: resCode)
                        if code == "1" {
                            success(JSON as Any)
                        }else{
                            failure(["code":"2","message":"后台返回错误"])
                        }
                    }else{
                        failure(["code":"2","message":"返回数据格式错误"])
                    }
                }
            }else{
                failure(["code":"\(code!)","message":"请求失败"])
            }
            
        }
        
    }
    

    
    
    

}
