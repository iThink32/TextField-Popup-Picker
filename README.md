# Pop-Up-Text-Field
A Text Field With Capabilities of Displaying and removing a custom pop up

![alt text](https://github.com/iThink32/Pop-Up-Text-Field/blob/master/popUpTextField.gif)

Points to note:-

In this func 
```
func displayPopup(errImg:String = "errIcon",popUpMsg:String,presentationController:UIViewController)
    {
        btnError = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        self.rightView = btnError
        self.rightViewMode = UITextFieldViewMode.always
        displayController = presentationController
        self.popUpMessage = popUpMsg
        guard let errorButton = btnError else{
            print("Falied To Initialize Error Button In Custom Text Field")
            return
        }
        errorButton.setBackgroundImage(UIImage(named: errImg), for: UIControlState.normal)
        errorButton.addTarget(self, action:#selector(CustomTextField.displayPopUp), for: UIControlEvents.touchUpInside)
    }
```
- make sure that errIcon is an image added to your assets
- the buttons frame matches the size of the image added to the assets , please do not use a big image as this is going to be added in the accessory view of the text field.

Replace this func :-

```
 private func popOverViewInstance(errorMsg:String?)->UIViewController
    {
        let registerStoryboard = UIStoryboard.registerStoryboardReference()
        let popOver = registerStoryboard.instantiateViewController(withIdentifier: kPopOverControllerIdentifier) as! PopOverVC
        popOver.errMsg = errorMsg
        return popOver
    }
 ```   
    using the same func definintion but the only change being that you have to return your custom pop - up view controller for eg:-
    
     private func popOverViewInstance(errorMsg:String?)->UIViewController
    {
       //instantiate , populate and return your custom pop over view controller
    }
