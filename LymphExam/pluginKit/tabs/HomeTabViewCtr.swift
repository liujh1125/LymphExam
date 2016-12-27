//
//  HomeTabViewCtr.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/25.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

class HomeTabViewCtr: FatherTableViewCtr {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        drawNoHeaderTableView()

        
        
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let  cell = UITableViewCell(style: .default, reuseIdentifier: "reuseIdentifier")
        cell.selectionStyle = .none
        
        cell.textLabel?.text = ["调查问卷","健康统计","在线咨询"][indexPath.row]
        
        
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
