//
//  LearnTabViewCtr.swift
//  LymphExam
//
//  Created by ehmo on 2016/12/25.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

class LearnTabViewCtr: FatherTableViewCtr {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        drawHeaderTableView()
        self.tabView.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.white
        self.tabView.separatorStyle = .singleLine
        self.header.titleLab.text = "学习"
        self.header.leftButton.isHidden = true
        
        let tabHeader = UIView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: 208))
        let videoImg = UIImageView(image: UIImage.init(named: "default_video.jpg"))
        videoImg.frame = tabHeader.bounds
        tabHeader.addSubview(videoImg)
        self.tabView.tableHeaderView = tabHeader
        
        self.tabView.rowHeight = 120
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = Bundle.main.loadNibNamed("LearnPageCell", owner: self, options: nil)?.first as! LearnPageCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        cell.nameLab.text = "淋巴瘤是起源于淋巴造血系统的恶性肿瘤，主要表现为无痛性淋巴结肿大，肝脾肿大，全身各组织器官均可受累，伴发热、盗汗、消瘦、瘙痒等全身症状"
        cell.descLab.text = "根据瘤细胞分为非霍奇金淋巴瘤（NHL）和霍奇金淋巴瘤（HL）两类。病理学特征在霍奇金淋巴瘤为瘤组织内含有淋巴细胞、嗜酸性粒细胞、浆细胞和特异性的里-斯（Reed-Steinberg）细胞，HL按照病理类型分为结节性富含淋巴细胞型和经典型，后者包括淋巴细胞为主型、结节硬化型、混合细胞型和淋巴细胞消减型"
        
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
