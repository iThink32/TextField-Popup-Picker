# Picker Text Field Readme

## A Text Field With Capabilities of Displaying and Picker with a Done button

you first create a PickerTextFieldModel like

```
let model = PickerTextFieldModel(titles: ["Red","Blue","Green"])
```
then you initialize it like

```
textField.initializePicker(model: dataSource)
textField.pickerDelegate = self.view as? PickerTextFieldDelegate
```
and conform to the delegate thats it !!

You can set your arrow image in the @IBInspector as shown below:-

![alttext](https://github.com/iThink32/TextField-Popup-Picker/blob/master/Screen%20Shot%202018-01-19%20at%203.45.46%20PM.png)

NOTE :- THIS IS A SUBCLASS OF FORM TEXT FIELD PLS ADD THAT TOO IT IS IN THIS REPO


