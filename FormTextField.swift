//
//  FormTextField.swift
//  RynlyUI
//
//  Created by N A Shashank on 1/16/18.
//  Copyright © 2018 N A Shashank. All rights reserved.
//

import UIKit

public class FormTextField:UITextField {
    
    @IBInspectable var rightViewImageName:String = String()
    @IBInspectable var placeholderColor:UIColor = UIColor.white
    @IBInspectable var leftOffset:CGFloat = 0.0
    @IBInspectable var plcholderFontSize:CGFloat = 14.0
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedStringKey.foregroundColor:self.placeholderColor,NSAttributedStringKey.font : UIFont.italicSystemFont(ofSize: self.plcholderFontSize)]) 
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        super.editingRect(forBounds: bounds)
        return self.editableRect(bounds: bounds)
    }
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        super.textRect(forBounds: bounds)
        return self.editableRect(bounds: bounds)
    }
    
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        super.placeholderRect(forBounds: bounds)
        return self.editableRect(bounds: bounds)
    }
    
    func editableRect(bounds:CGRect) -> CGRect {
        let rightViewWidth:CGFloat = (self.rightViewImageName == "") ? 0 : 20
        return CGRect(x: bounds.origin.x + self.leftOffset, y:bounds.origin.y , width: bounds.width - rightViewWidth, height: bounds.height) // 20 for right view
    }
    
    public func addButtonOnKeyboard(title:String,target:Any?,selector:Selector) {
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width, height: 50))
        let btnDone = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.done, target: target, action: selector)
        let leftFlexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let rightFlexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.items = [leftFlexSpace,btnDone,rightFlexSpace]
        self.inputAccessoryView = toolbar
    }
    
}
