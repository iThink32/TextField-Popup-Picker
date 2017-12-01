# Pop-Up-Text-Field
A Text Field With Capabilities of Displaying and removing a custom pop up

Replace this func :-

 private func popOverViewInstance(errorMsg:String?)->UIViewController
    {
        let registerStoryboard = UIStoryboard.registerStoryboardReference()
        let popOver = registerStoryboard.instantiateViewController(withIdentifier: kPopOverControllerIdentifier) as! PopOverVC
        popOver.errMsg = errorMsg
        return popOver
    }
    
    using the same func definintion but the only change being that you have to return your custom pop - up view controller for eg:-
    
     private func popOverViewInstance(errorMsg:String?)->UIViewController
    {
       //instantiate , populate and return your custom pop over view controller
    }
