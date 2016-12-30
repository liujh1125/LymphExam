//
//  KF_DataPickerView.swift
//  KFDoctor
//
//  Created by msk on 2016/11/7.
//  Copyright © 2016年 e-Hmo. All rights reserved.
//

import UIKit

@objc protocol DataPickViewDelegate {
    @objc optional func dataPickerViewDidSelect(index:NSInteger)
}

class DataPickerView: UIView,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    private var dataResources : NSArray!
    var delegate : DataPickViewDelegate?
    
    override func awakeFromNib() {
        picker.delegate=self
        picker.dataSource=self
    }
    
    @IBAction func cancelClickAction(_ sender: AnyObject) {
        delegate?.dataPickerViewDidSelect!(index: -1)
    }
    
    @IBAction func confirmClickAction(_ sender: AnyObject) {
        let index = picker.selectedRow(inComponent: 0)
        delegate?.dataPickerViewDidSelect!(index: index)
    }
    
    func loadDataWith(dataArray:NSArray){
        dataResources=dataArray
        picker.reloadAllComponents()
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataResources.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataResources[row] as? String
    }
    
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
}
