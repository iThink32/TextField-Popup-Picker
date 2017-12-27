//
//  CustomTextField.swift
//
//  Created by Shashank  on 2/22/16.
//

import UIKit

class CustomTextField:UITextField,UIPopoverPresentationControllerDelegate
{
    var displayController:UIViewController?
    var popOverView:UIViewController?
    var popUpMessage = String()
    var btnError:UIButton?
    
    func displayPopup(errImg:String = "errMsg",popUpMsg:String,presentationController:UIViewController)
    {
        self.btnError = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        self.rightView = btnError
        self.rightViewMode = UITextFieldViewMode.always
        displayController = presentationController
        self.popUpMessage = popUpMsg
        guard let errorButton = btnError else{
            print("Falied To Initialize Error Button In Custom Text Field")
            return
        }
        errorButton.setBackgroundImage(UIImage(named: errImg), for: UIControlState.normal)
        errorButton.addTarget(self, action:#selector(self.displayPopUp), for: UIControlEvents.touchUpInside)
    }
    
    func removePopup()
    {
        self.rightView = nil
    }
    
    @objc private func displayPopUp()
    {
        guard let dispController = displayController,let errorBtn = btnError else{
            return
        }
        popOverView = self.initializePopOverControllerBasedOnFrame(errMsg: popUpMessage,btn: errorBtn,presentationController: dispController)
        guard let popOver = popOverView else{
            return
        }
        dispController.present(popOver, animated: true, completion: nil)
    }
    
    private func initializePopOverControllerBasedOnFrame(errMsg:String,btn:UIButton,presentationController:UIViewController) -> UIViewController?
    {
        let popOverView = popOverViewInstance(errorMsg: errMsg)
        popOverView.modalPresentationStyle = UIModalPresentationStyle.popover
        let testLbl = UILabel(frame: CGRect(x: 0, y: 0, width: presentationController.view.frame.size.width - 40, height: 0))
        testLbl.numberOfLines = 0
        testLbl.text = errMsg
        testLbl.sizeToFit()
        //277 h 30 wpresentationController.view.frame.size.width - 40
        popOverView.preferredContentSize = CGSize(width:testLbl.frame.size.width, height: testLbl.frame.size.height + 20)
        guard let popOverPresentationController = popOverView.popoverPresentationController else{
            print("Pop Over Presentation Controller Could Not Be Instantiated")
            return nil
        }
        popOverPresentationController.backgroundColor = UIColor.white
        popOverPresentationController.permittedArrowDirections = UIPopoverArrowDirection.down
        popOverPresentationController.sourceView = btn
        popOverPresentationController.sourceRect = CGRect(x: 0, y:-5, width: btn.bounds.width, height: btn.bounds.height)
        popOverPresentationController.delegate = self
        return popOverView
    }
    
    private func popOverViewInstance(errorMsg:String)->UIViewController
    {
        let registerStoryboard = UIStoryboard.register()
        let popOver = registerStoryboard.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
        popOver.errMsg = errorMsg
        return popOver
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    //to fix the ios issue due to which the popover was not positioned at the center of the image
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + bounds.width - 15, y: bounds.origin.y, width: 20, height: 20)
    }
    
}
