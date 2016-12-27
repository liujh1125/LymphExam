//
//  UserLoginViewCtr.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/25.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

class UserLoginViewCtr: UIViewController ,HeadViewDelegate{
    
    @IBOutlet weak var header:HeadView!
    @IBOutlet weak var phoneLab:UITextField!
    @IBOutlet weak var passwordLab:UITextField!
    @IBOutlet weak var forgetBtn:UIButton!
    @IBOutlet weak var loginBtn:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        header.delegate = self
        header.titleLab.text = "登录"
        header.leftButton.isHidden = true
        
        phoneLab.setCornerRadius(radius: 5)
        phoneLab.setBorderWidth(width: 1, bordColor: COLOR_MAIN)
        passwordLab.setCornerRadius(radius: 5)
        passwordLab.setBorderWidth(width: 1, bordColor: COLOR_MAIN)
        
        header.rightButton.isHidden = false
        header.rightButton.setTitle("注册", for: .normal)
        
        
        loginBtn.setCornerRadius(radius: 6)
        
        
        
        
    }
    
    // 注册
    func responseRightAction(){
        
        let registerCtr = UserRegisterViewCtr()
        self.navigationController?.pushViewController(registerCtr, animated: true)
        
    }
    // 忘记密码触发事件
    @IBAction func forgetPwdAction(){
        
        
    }
    
    // 登录按钮事件
    @IBAction func loginAction(){
        
//        let notification = NotificationCenter.default
//        notification.post(name: NSNotification.Name(LoginSuccess), object: "LoginIn")
        
        self.showLoading()
        HttpRequest.alamofirePost(urlString: "exam/app/frontDeskCtrl/sysInitExam.do", paramet: [:], success: { respond in
            self.hideLoading()
            
            print("-------respond-----\(respond)")
            
        }) { error in
            
            self.showErrorMessage(errorDt: error as! Dictionary<String, Any>)
        }
        
        
        
//        self.showLoading()
//        HttpRequestOC.httpPost("exam/app/frontDeskCtrl/sysInitExam.do", body: [:], success: { (respond) in
//            self.hideLoading()
//            
//            
//        }) { (error) in
//            self.hideLoading()
//            
//            
//        }
        
//        HttpRequest().httpPost(urlString: "exam/app/frontDeskCtrl/sysInitExam.do", paramet: [:], success: { respond in
//            print("成功")
//        }) { error in
//            print("失败")
//        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
