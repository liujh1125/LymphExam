//
//  UserRegisterViewCtr.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/25.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

class UserRegisterViewCtr: UIViewController ,HeadViewDelegate{
    
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
        


        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
