//
//  HeadView.swift
//  KFDoctor
//
//  Created by ehmo on 2016/11/2.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

@objc protocol HeadViewDelegate:NSObjectProtocol{
    
    @objc optional func responseLeftAction()
    
    
    @objc optional func responseRightAction()
    
    
}

class HeadView: UIView {
    
    @IBOutlet weak var delegate:HeadViewDelegate?
    
    @IBOutlet weak var contentView:UIView!
    @IBOutlet weak var leftButton:UIButton!
    @IBOutlet weak var rightButton:UIButton!
    @IBOutlet weak var titleLab:UILabel!
    
    
    public override init(frame: CGRect){
        super.init(frame: frame)
        
        self.loadView()
    }
    
    public required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.loadView()
    }
    
    func loadView() {
        
        Bundle.main.loadNibNamed("HeadView", owner: self, options: nil)
        self.addSubview(self.contentView)
        
        self.contentView.backgroundColor = COLOR_MAIN
        
        self.leftButton.setImage(UIImage(named:"return.png"), for: .normal)
        self.leftButton.setTitle("", for: .normal)
        self.leftButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 0)
        
        
        
        self.rightButton.isHidden = true
        self.rightButton.setTitle("", for: .normal)
        self.rightButton.setTitleColor(UIColor.white, for: .normal)
        self.rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        self.titleLab.text = ""
        self.titleLab.textColor = UIColor.white
        self.titleLab.font = UIFont.systemFont(ofSize: 17)
        
        
        
    }
    
    @IBAction func leftButtonAction(_ button:UIButton) {
        delegate?.responseLeftAction!()
    }
    
    @IBAction func rightButtonAction(_ button:UIButton) {
        delegate?.responseRightAction!()
    }



}
