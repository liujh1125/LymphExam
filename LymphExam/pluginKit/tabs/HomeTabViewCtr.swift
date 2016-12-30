//
//  HomeTabViewCtr.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/25.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit
import SnapKit

class HomeTabViewCtr: FatherTableViewCtr {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        drawNoHeaderTableView()
        self.tabView.backgroundColor = COLOR_GRAY
        self.view.backgroundColor = COLOR_GRAY
        self.tabView.rowHeight = 65
        self.tabView.separatorStyle = .none

        let hdbg = UIView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: 410))
        let tabHeader = Bundle.main.loadNibNamed("HomeHeaderView", owner: self, options: nil)?.first as! HomeHeaderView
        tabHeader.frame = CGRect(x: 0, y: -20, width: WIDTH, height: 430)
        hdbg.addSubview(tabHeader)
        self.tabView.tableHeaderView = hdbg
        

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = Bundle.main.loadNibNamed("HomePageCell", owner: self, options: nil)?.first as! HomePageCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        cell.nameLab.text = ["调查问卷","健康统计","在线咨询"][indexPath.row]
        cell.iconImg.image = UIImage.init(named: ["home_ico1.png","home_ico2.png","home_ico3.png"][indexPath.row])
        cell.countLab.snp.updateConstraints { (make) in
            make.width.equalTo(18)
            make.height.equalTo(18)
        }
        cell.countLab.setCornerRadius(radius: 9)
        cell.countLab.text = "15"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
