//
//  AddHourViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 6/15/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class AddHourViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var hourName: UITextField!
    @IBOutlet weak var hour: UITextField!
    @IBAction func addHour(sender: AnyObject) {
        /**button.transform = CGAffineTransformMakeScale(1.5, 1.5)
        UIView.animateWithDuration(2.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.button.transform = CGAffineTransformIdentity
            }, completion: nil)**/
        if (hourName.text != "" && hour.text != "")
        {
            let dict = ["title":hourName.text!, "subtitle":hour.text!]
            schedule.append(dict)
            //print(dict)
            //let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "ScheduleCell")
            //cell.textLabel!.text = hourName.text
            //cell.detailTextLabel!.text = hour.text
            //hours.append(cell)
            //print(hours)
            NSUserDefaults.standardUserDefaults().setObject(schedule, forKey: "schedule")
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    @IBOutlet weak var date: UILabel!
    
    override func viewDidLoad() {
        date.text = ""
    }
    override func viewDidAppear(animated: Bool) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        date.text = "Today is " + dateFormatter.stringFromDate(NSDate()) + ". "
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        date.text = date.text! + "And, the time right now is " + dateFormatter.stringFromDate(NSDate()) + "."
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == hourName
        {
            textField.resignFirstResponder()
            hour.selected = true
        }
        if textField == hour
        {
            textField.resignFirstResponder()
            self.addHour(self)
        }
        return true
    }
}
