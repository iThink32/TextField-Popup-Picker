//
//  PickerTextField.swift
//  RynlyUI
//
//  Created by N A Shashank on 1/16/18.
//  Copyright © 2018 N A Shashank. All rights reserved.
//

import UIKit

public struct PickerTextFieldModel {
    public var titles = [String]()
    public init(titles:[String]) {
        self.titles = titles
    }
}

public protocol PickerTextFieldDelegate:class {
    func rowSelected(row: Int,component: Int,sender:PickerTextField)
}

public class PickerTextField:FormTextField,UIPickerViewDelegate,UIPickerViewDataSource {

    private var dataSource:PickerTextFieldModel?
    var pickerView = UIPickerView()
    public weak var pickerDelegate:PickerTextFieldDelegate?
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        let bundle = Bundle(for: PickerTextField.self)
        let imageView = UIImageView(image:UIImage(named: self.rightViewImageName, in: bundle, compatibleWith: nil))
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        self.rightView = imageView
        self.rightViewMode = UITextFieldViewMode.always
        self.pickerView.delegate = self
        self.inputView = self.pickerView
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width, height: 50))
        let btnDone = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneButtonClicked))
        let leftFlexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let rightFlexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.items = [leftFlexSpace,btnDone,rightFlexSpace]
        self.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonClicked() {
        self.pickerDelegate?.rowSelected(row: self.pickerView.selectedRow(inComponent: 0), component: 0,sender:self)
        self.resignFirstResponder()
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let model = self.dataSource else{
            return 0
        }
        return model.titles.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let model = self.dataSource else{
            return nil
        }
        return model.titles[row]
    }
    
    public func initializePicker(model:PickerTextFieldModel) {
        self.dataSource = model
        self.pickerView.reloadAllComponents()
    }
    
}
