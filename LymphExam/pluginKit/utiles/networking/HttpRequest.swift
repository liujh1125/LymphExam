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
        if urlString.components(separatedBy: "http").count <= 1 {
            newUrlString = BASEURL + urlString
        }
        
        let headers: HTTPHeaders = ["Accept":"application/json"]
        Alamofire.request(newUrlString, method: .post, parameters: paramet, encoding: JSONEncoding.prettyPrinted, headers: headers).responseJSON { response in
            
            print("请求：" + (response.request?.url?.absoluteString)! + "\n参数：\(paramet)")  // original URL request
            print("响应：\(response.result) \n \((response.response)!) ") // HTTP URL response
            
            let code =   response.response?.statusCode
            if code == 200 {
                
                if let JSON = response.result.value {
                    print("返回：\((response.result.value)!)")   // result of response serialization
                    let rspDt = JSON as! Dictionary<String,Any>

                    if let resCode = rspDt["resCode"] {
                        let code = Utils.StringValue(str: resCode)
                        if code == "1" {
                            success(JSON as Any)
                        }else{
                            let errMessage = rspDt["resMsg"] as! String
                            failure(["code":code,"message":errMessage])
                        }
                    }else{
                        failure(["code":"2","message":"返回数据格式错误"])
                    }
                }else{
                    failure(["code":"2","message":"返回数据格式错误"])
                }
                
            }else{
                failure(["code":"\(code!)","message":"请求失败"])
            }
        }
        
    }
    static func alamofireGet(urlString:String,paramet: Dictionary<String, Any>, success:@escaping Success, failure:@escaping Failure){
        
        var newUrlString = urlString
        if urlString.components(separatedBy: "http").count <= 1 {
            newUrlString = BASEURL + urlString
        }
        
        let headers: HTTPHeaders = [:]
        Alamofire.request(newUrlString, method: .get, parameters: paramet, encoding: JSONEncoding.prettyPrinted, headers: headers).responseJSON { response in
            
            print("请求：" + (response.request?.url?.absoluteString)!)  // original URL request
            print("响应：\(response.result) \n \((response.response)!) ") // HTTP URL response
            
            let code =   response.response?.statusCode
            if code == 200 {
                
                if let JSON = response.result.value {
                    print("返回：\((response.result.value)!)")   // result of response serialization
                    let rspDt = JSON as! Dictionary<String,Any>
                    
                    if let resCode = rspDt["resCode"] {
                        let code = Utils.StringValue(str: resCode)
                        if code == "1" {
                            success(JSON as Any)
                        }else{
                            let errMessage = rspDt["resMsg"] as! String
                            failure(["code":code,"message":errMessage])
                        }
                    }else{
                        failure(["code":"2","message":"返回数据格式错误"])
                    }
                }else{
                    failure(["code":"2","message":"返回数据格式错误"])
                }
                
            }else{
                failure(["code":"\(code!)","message":"请求失败"])
            }
            
        }
        
    }
    

    
    
    

}
