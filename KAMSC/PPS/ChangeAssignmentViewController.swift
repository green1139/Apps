//
//  ChangeAssignmentViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 6/16/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ChangeAssignmentViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var assignmentName: UITextField!
    @IBOutlet weak var hour: UIPickerView!
    @IBAction func change(sender: AnyObject)
    {
        button.transform = CGAffineTransformMakeScale(1.5, 1.5)
        UIView.animateWithDuration(2.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.button.transform = CGAffineTransformIdentity
            }, completion: nil)
        let selectedrow = hour.selectedRowInComponent(0)
        if (assignmentName.text != "")
        {
            if (selectedrow == 0)
            {
                let alert = UIAlertController(title: "Please Select a valid Class", message: "If you did not add any classes, please add one in the \"Classes\" tab.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else
            {
                let dict = ["assignment":assignmentName.text!, "hour":(subjects[selectedrow-1]["subject"] as? String)!, "index":(selectedrow-1)]
                assignments[assignmentCellRow] = dict
                NSUserDefaults.standardUserDefaults().setObject(assignments, forKey: "assignments")
                self.navigationController?.popToRootViewControllerAnimated(true)
            }
        }
    }
    @IBOutlet weak var date:UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        assignmentName.text = assignments[assignmentCellRow]["assignment"] as? String
        hour.reloadAllComponents()
        hour.selectRow(0, inComponent: 0, animated: true)
        date.text = ""
    }
    override func viewDidAppear(animated: Bool)
    {
        assignmentName.text = assignments[assignmentCellRow]["assignment"] as? String
        hour.reloadAllComponents()
        if (subjects.endIndex >= ((assignments[assignmentCellRow]["index"] as? Int)! + 1))
        {
            hour.selectRow((assignments[assignmentCellRow]["index"] as? Int)! + 1, inComponent: 0, animated: true)
        }
        else
        {
            hour.selectRow(0, inComponent: 0, animated: true)
        }
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        date.text = "Today is " + dateFormatter.stringFromDate(NSDate()) + ". "
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        date.text = date.text! + "And, the time right now is " + dateFormatter.stringFromDate(NSDate()) + "."
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return subjects.count + 1
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if (row == 0)
        {
            return "None"
        }
        else
        {
            return (subjects[row-1]["subject"] as? String)
        }
    }
}
