//
//  KF_TimePickerView.swift
//  KFDoctor
//
//  Created by msk on 2016/11/7.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

@objc protocol TimePickViewDelegate {
    @objc optional func timePickerViewDidSelectTime(time:String)
}

class TimePickerView: UIView {
    
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate : TimePickViewDelegate?
    
    override func awakeFromNib() {
        datePicker.maximumDate=NSDate() as Date
        cancelBtn.layer.cornerRadius=5
        cancelBtn.clipsToBounds=true
        confirmBtn.layer.cornerRadius=5
        confirmBtn.clipsToBounds=true
    }
    
    @IBAction func cancelClickAction(_ sender: AnyObject) {
        delegate?.timePickerViewDidSelectTime!(time: "")
    }
    
    @IBAction func confirmClickAction(_ sender: AnyObject) {
//        let formatStr = "yyyy-MM-dd HH:mm:ss"
        let formatStr = "yyyy-MM-dd"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat=formatStr
        dateFormatter.locale=NSLocale.init(localeIdentifier: "zh_CN") as Locale!
        let dateStr = dateFormatter.string(from: datePicker.date)
        delegate?.timePickerViewDidSelectTime!(time: dateStr)
    }
}
