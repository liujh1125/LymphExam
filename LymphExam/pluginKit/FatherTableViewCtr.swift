//
//  FatherTableViewCtr.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/26.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

class FatherTableViewCtr: UIViewController,HeadViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var header:HeadView!
    var tabView:UITableView!
    var dataArray = Array<Dictionary<String, Any>>()
    
    
    func drawHeaderView() {
        header = HeadView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: 64))
        header.delegate = self
        self.view.addSubview(header)
    }
    
    func responseLeftAction(){
       _ = self.navigationController?.popViewController(animated: true)
    }
    
    func responseRightAction(){
        
    }
    

    func drawHeaderTableView(){
        
        drawHeaderView()

        tabView = UITableView(frame: CGRect(x: 0, y: 64, width: WIDTH, height: HEIGHT-64), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        self.view.addSubview(tabView)
        
        tabView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: 0))
    }
    
    func drawNoHeaderTableView(){

        tabView = UITableView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        self.view.addSubview(tabView)
        
        tabView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: 64))
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let  cell = UITableViewCell(style: .default, reuseIdentifier: "reuseIdentifier")
        cell.selectionStyle = .none
        
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    

}
