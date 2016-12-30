//
//  MineTabViewCtr.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/25.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

class MineTabViewCtr: FatherTableViewCtr {


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawNoHeaderTableView()
        
        tabView.backgroundColor = RGB(r: 229, g: 230, b: 231)
        tabView.rowHeight = 50

        
        var aReact = CGRect.zero, bounds = CGRect(x: 0, y: 0, width: WIDTH, height: 160)
        let bgView = UIView(frame: bounds)
        tabView.tableHeaderView = bgView
        
        let headerView = UIView(frame: CGRect(x: 0, y: -22, width: WIDTH, height: 180))
        headerView.backgroundColor = COLOR_MAIN
        bgView.addSubview(headerView)
        
        
        bounds = CGRect(x: 0, y: 0, width: WIDTH, height: headerView.frame.height)
        (aReact,bounds) = bounds.divided(atDistance: 50, from: .maxYEdge)
        let nameLab = UILabel(frame: aReact)
        nameLab.text = "李四"
        nameLab.textColor = UIColor.white
        nameLab.textAlignment = .center
        nameLab.font = UIFont.systemFont(ofSize: 16)
        headerView.addSubview(nameLab)
        
        (aReact,bounds) = bounds.divided(atDistance: 80, from: .maxYEdge)
        let avatar = UIButton(type: .custom)
        avatar.frame = CGRect(x: (WIDTH-80)/2, y: aReact.origin.y, width: 80, height: 80)
        avatar.setImage(UIImage.init(named: "headicon.png"), for: .normal)
        avatar.setCornerRadius(radius: 40)
        headerView.addSubview(avatar)
        
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
            cell.textLabel?.text = ["基本信息","病历信息"][indexPath.row]
            cell.imageView?.image = UIImage.init(named: ["mine_info_icon.png","mine_ehr_icon.png"][indexPath.row])
        }else{
            cell.textLabel?.text = "设置"
            cell.imageView?.image = UIImage.init(named:"mine_set_icon.png")
        }

        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let infoCtr = UserProfileViewCtr()
                self.navigationController?.pushViewController(infoCtr, animated: true)
            }
        }
        if indexPath.section == 1 {
            let setCtr = SettingViewCtr()
            self.navigationController?.pushViewController(setCtr, animated: true)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
