//
//  ChangeHourViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 6/16/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ChangeHourViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var className: UITextField!
    @IBOutlet weak var hour: UITextField!
    @IBOutlet weak var date:UILabel!
    @IBAction func change(sender: AnyObject)
    {
        /**button.transform = CGAffineTransformMakeScale(1.5, 1.5)
         UIView.animateWithDuration(2.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
         self.button.transform = CGAffineTransformIdentity
         }, completion: nil)
         **/
        let dict = ["title":className.text!, "subtitle":hour.text!]
        schedule[cellRow] = dict
        NSUserDefaults.standardUserDefaults().setObject(schedule, forKey: "schedule")
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ///className.text = schedule[cellRow]["title"]
        className.text = ""
        ///hour.text = schedule[cellRow]["subtitle"]
        hour.text = ""
        date.text = ""
    }
    override func viewDidAppear(animated: Bool)
    {
        className.text = schedule[cellRow]["title"]
        hour.text = schedule[cellRow]["subtitle"]
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        date.text = "Today is " + dateFormatter.stringFromDate(NSDate()) + ". "
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        date.text = date.text! + "And, the time right now is " + dateFormatter.stringFromDate(NSDate()) + "."
    }
}
