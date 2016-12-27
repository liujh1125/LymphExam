//
//  SettingViewCtr.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/26.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

class SettingViewCtr: FatherTableViewCtr {

    override func viewDidLoad() {
        super.viewDidLoad()

        drawHeaderTableView()
        
        header.titleLab.text = "设置"
        
        tabView.backgroundColor = RGB(r: 229, g: 230, b: 231)
        
        
        
        
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int{
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if section == 0 {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        
        return 15
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let secView = UIView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: 15))
        secView.backgroundColor = RGB(r: 229, g: 230, b: 231)
        return secView
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let  cell = UITableViewCell(style: .default, reuseIdentifier: "reuseIdentifier")
        cell.selectionStyle = .none
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = ["当前版本","清除缓存"][indexPath.row]
        }else{
            cell.textLabel?.text = "退出"
        }
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 1 {
            
            let notification = NotificationCenter.default
            notification.post(name: NSNotification.Name(LoginSuccess), object: "LoginOut")
            
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
