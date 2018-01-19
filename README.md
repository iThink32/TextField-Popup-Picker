# Pop-Up-Text-Field
A Text Field With Capabilities of Displaying and removing a custom pop up

![alt text](https://github.com/iThink32/Pop-Up-Text-Field/blob/master/popUpTextField.gif)

Points to note:-

In this func 
```
public func displayPopup(errImg:String = "errMsg",popUpMsg:String,presentationController:UIViewController)
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
```    
     private func popOverViewInstance(errorMsg:String?)->UIViewController
    {
       //instantiate , populate and return your custom pop over view controller
    }
 ```
 
 Its usage is as follows :-

```
currentTextField.displayPopup(popUpMsg: StringConstants.passwordMismatch, presentationController: controller)
```

and to remove it 

```
currentTextField.removePopup()
```

NOTE:THIS IS A SUBCLASS OF FORM TEXT FIELD SO PLS ADD THAT FILE TOO

There are other attributes in the IBInspector pls have a look at it.
