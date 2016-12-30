//
//  UserRegisterViewCtr.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/25.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

class UserRegisterViewCtr: UIViewController ,HeadViewDelegate, UITextFieldDelegate{
    
    @IBOutlet weak var header:HeadView!
    @IBOutlet weak var phoneLab:UITextField!
    @IBOutlet weak var passwordLab:UITextField!
    @IBOutlet weak var password2Lab:UITextField!
    @IBOutlet weak var confirmBtn:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        header.delegate = self
        header.titleLab.text = "注册"
        
        phoneLab.setCornerRadius(radius: 5)
        phoneLab.setBorderWidth(width: 1, bordColor: COLOR_MAIN)
        passwordLab.setCornerRadius(radius: 5)
        passwordLab.setBorderWidth(width: 1, bordColor: COLOR_MAIN)
        password2Lab.setCornerRadius(radius: 5)
        password2Lab.setBorderWidth(width: 1, bordColor: COLOR_MAIN)
        
        confirmBtn.setCornerRadius(radius: 6)
        
        
    }
    
    func responseLeftAction(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // 登录按钮事件
    @IBAction func registerAction(){
        let phone = phoneLab.text!
        let pwd1 = passwordLab.text!
        let pwd2 = password2Lab.text!
        
        if Utils.isTelNumber2(regString:phone) == false {
            self.showAlertMessage(message: "请输入正确的手机号码")
            return
        }
        if pwd1.characters.count == 0 || pwd2.characters.count == 0 {
            self.showAlertMessage(message: "请输入您的密码")
            return
        }
        if pwd1 != pwd2 {
            self.showAlertMessage(message: "两次输入的密码不一致")
            return
        }
        
        let jsonStr = "{'shoujihao':'\(phone)','password':'\(pwd1)'}"  // ["shoujihao":phone,"password":pwd1]//
        let paramDt = ["jsonStr":jsonStr]
        
        self.showLoading()
        HttpRequest.alamofirePost(urlString:"lbsz/app/appUserCtrl/register.do", paramet: paramDt, success: { respond in
            self.hideLoading()
            
            
        }) { error in
            self.showErrorMessage(errorDt: error as! Dictionary<String, Any>)
        }
        
        
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        if string == "" {
            return true
        }
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if newString.characters.count > 11 {
            return false
        }
        
        let isnumber = Utils.isNumber(regString: newString as String)
        if isnumber == true {
            return true
        }
        
        return false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
