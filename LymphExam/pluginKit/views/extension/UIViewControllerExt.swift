//
//  UIViewExt.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/25.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    
    
    func showLoading() {
        self.view.isUserInteractionEnabled = false
        self.view.endEditing(true)
        if let loadView = self.view.viewWithTag(0x20161230){
            let loading = loadView as! ActivityLoadingView
            loading.startAnimating()
        }else{
            let loadingView = ActivityLoadingView(frame: CGRect(x: (WIDTH-65)/2, y: (HEIGHT-62)/2, width: 65, height: 62))
            loadingView.tag = 0x20161230
            loadingView.startAnimating()
            self.view.addSubview(loadingView)
        }
    }
    
    func hideLoading(){
        self.view.isUserInteractionEnabled = true
        if let loadView = self.view.viewWithTag(0x20161230){
            let loading = loadView as! ActivityLoadingView
            loading.stopAnimating()
            loading.removeFromSuperview()
        }
    }
    
    func showErrorMessage(errorDt:Dictionary<String, Any>){
        
        self.hideLoading()
        
        if let code = errorDt["code"] {
            if let message = errorDt["message"] {
                
                print("\(code)  \(message)")
                
                let alCtr = UIAlertController(title: "提示", message: Utils.StringValue(str: message), preferredStyle: .alert)
                let alAction = UIAlertAction(title: "确定", style: .cancel, handler: { (UIAlertAction) in})
                alCtr.addAction(alAction)
                self.present(alCtr, animated: true, completion: nil)
            }
        }
        
    }
    
    
    
    
}
