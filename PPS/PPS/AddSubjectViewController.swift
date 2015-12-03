//
//  AddSubjectViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 6/30/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

var changingDict:Dictionary<String, AnyObject> = ["subject":"", "hour": "", "red":1.0, "blue":1.0, "green":1.0]
var rowIndex = 0

var subjectColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

//var isChangingColor = false

class AddSubjectViewController: UIViewController, UIPopoverPresentationControllerDelegate, SwiftColorPickerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var hour: UITextField!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var changeButton: UIButton!
    @IBAction func addSubject(sender: AnyObject) {
        (sender as! UIButton).transform = CGAffineTransformMakeScale(1.5, 1.5)
        /**UIView.animateWithDuration(2.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            (sender as! UIButton).transform = CGAffineTransformIdentity
            }, completion: nil)**/
        if ((!isChanging) && subject.text != "" && hour.text != "")
        {
            ///print("Not Changing: \(isChanging)")
            //let colors = CGColorGetComponents(subjectColor.CGColor)
            var red:CGFloat = 0
            var green:CGFloat = 0
            var blue:CGFloat = 0
            var alpha:CGFloat = 0
            subjectColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            ///print("\(Float(red)*255.0) , \(Float(green)*255.0), \(Float(blue)*255.0)")
            let dict:Dictionary<String, AnyObject> = ["subject":subject.text!, "hour": hour.text!, "red":(Float(red)), "blue":(Float(blue)), "green":(Float(green))]
            subjects.append(dict)
            NSUserDefaults.standardUserDefaults().setObject(subjects, forKey: "subjects")
            self.navigationController?.popViewControllerAnimated(true)
            //self.navigationController?.popToRootViewControllerAnimated(true)
        }
        else if (isChanging && subject.text != "" && hour.text != "")
        {
            ///print("Is Changing: \(isChanging)")
            //let colors = CGColorGetComponents(subjectColor.CGColor)
            var red:CGFloat = 0
            var green:CGFloat = 0
            var blue:CGFloat = 0
            var alpha:CGFloat = 0
            subjectColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            ///print("\(Float(red)*255.0) , \(Float(green)*255.0), \(Float(blue)*255.0)")
            let dict:Dictionary<String, AnyObject> = ["subject":subject.text!, "hour": hour.text!, "red":(Float(red)), "blue":(Float(blue)), "green":(Float(green))]
            subjects[rowIndex] = dict
            NSUserDefaults.standardUserDefaults().setObject(subjects, forKey: "subjects")
            //self.navigationController?.popToRootViewControllerAnimated(true)
            isChanging = !isChanging
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    @IBAction func pickColor(sender: AnyObject) {
        let colorPickerVC = SwiftColorPickerViewController()
        colorPickerVC.delegate = self
        colorPickerVC.modalPresentationStyle = .Popover
        let popVC = colorPickerVC.popoverPresentationController!;
        popVC.sourceRect = sender.frame
        popVC.sourceView = self.view
        popVC.permittedArrowDirections = .Any;
        popVC.delegate = self;
        
        self.presentViewController(colorPickerVC, animated: true, completion: nil)
    }
    override func viewDidAppear(animated: Bool) {
        ///print("is changing? \(isChanging)")
        ///print("subjectColor = \(subjectColor)")
        if (isChanging)
        {
            
            ///print("changing the color.")
            button.hidden = true
            changeButton.hidden = false
            subject.text = changingDict["subject"] as? String
            hour.text = changingDict["hour"] as? String
            subjectColor = UIColor(red: changingDict["red"] as! CGFloat, green: changingDict["green"] as! CGFloat, blue: changingDict["blue"]as! CGFloat, alpha: 1.0)
            subject.textColor = subjectColor
            colorButton.setTitleColor(subjectColor, forState: UIControlState.Normal)
            ///print("\(changingColor) : \(colorButton.titleColorForState(UIControlState.Normal))")
        }
        else
        {
            ///print("creating new and not changing the color.")
            button.hidden = false
            changeButton.hidden = true
            subject.text = ""
            hour.text = ""
            colorButton.setTitleColor(subjectColor, forState: UIControlState.Normal)
        }
    }
    func colorSelectionChanged(selectedColor color: UIColor) {
        
        colorButton.setTitleColor(subjectColor, forState: UIControlState.Normal)
        subject.textColor = color
        subjectColor = color
    }
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        
        return UIModalPresentationStyle.None
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillDisappear(animated: Bool) {
        isChanging = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
