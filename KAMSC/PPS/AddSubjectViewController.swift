//
//  AddSubjectViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 6/30/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

var subjectColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
class AddSubjectViewController: UIViewController, UIPopoverPresentationControllerDelegate, SwiftColorPickerDelegate {
    
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var hour: UITextField!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var button: UIButton!
    @IBAction func showColorPickerProgrammatically(sender: UIButton)
    {
        let colorPickerVC = SwiftColorPickerViewController()
        colorPickerVC.delegate = self
        colorPickerVC.modalPresentationStyle = UIModalPresentationStyle.Popover
        let popVC = colorPickerVC.popoverPresentationController!;
        popVC.sourceRect = sender.frame
        popVC.sourceView = self.view
        popVC.permittedArrowDirections = .Any;
        popVC.delegate = self;
        self.presentViewController(colorPickerVC, animated: true, completion: nil)
        ///self.navigationController?.pushViewController(colorPickerVC, animated: true)
    }
    @IBAction func addSubject(sender: AnyObject) {
        button.transform = CGAffineTransformMakeScale(1.5, 1.5)
        UIView.animateWithDuration(2.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.button.transform = CGAffineTransformIdentity
            }, completion: nil)
        if (subject.text != "" && hour.text != "")
        {
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
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    
    // MARK: popover presentation delegates
    
    // this enables pop over on iphones
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        
        return UIModalPresentationStyle.None
    }
    
    // MARK: Color Picker Delegate
    
    func colorSelectionChanged(selectedColor color: UIColor) {
        
        colorButton.setTitleColor(color, forState: UIControlState.Normal)
        subject.textColor = color
        subjectColor = color
        ///var red:CGFloat = 0
        ///var green:CGFloat = 0
        ///var blue:CGFloat = 0
        ///var alpha:CGFloat = 0
        ///color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        ///print("\(Float(red)*255.0) , \(Float(green)*255.0), \(Float(blue)*255.0)")
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let _ = segue.identifier
        {
            // adding as delegate for color selection
            let colorPickerVC = segue.destinationViewController as! SwiftColorPickerViewController
            colorPickerVC.delegate = self
            
            if let popPresentationController = colorPickerVC.popoverPresentationController {
                popPresentationController.delegate = self
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
