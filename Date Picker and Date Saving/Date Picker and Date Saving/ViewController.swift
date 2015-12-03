//
//  ViewController.swift
//  Date Picker and Date Saving
//
//  Created by Siddhant Pagariya on 8/6/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    ///var timeinterval:NSTimeInterval = 0
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func editingFinished(sender: AnyObject) {
        print(datePicker.date)
        print(datePicker.date.timeIntervalSince1970)
        ///timeinterval = NSDate().timeIntervalSince1970
        print(NSDate(timeIntervalSince1970: datePicker.date.timeIntervalSince1970))
        ///print(datePicker.timeZone)
        
        let localNotification = UILocalNotification()
        localNotification.alertAction = "Open the PPS App"
        localNotification.alertBody = "It works"
        localNotification.fireDate = datePicker.date
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePicker.timeZone = NSTimeZone()
        /**let localNotification: UILocalNotification = UILocalNotification()
        localNotification.alertAction = "Testing notifications on iOS8"
        localNotification.alertBody = "It works"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)**/
    }
    override func viewDidAppear(animated: Bool) {
        datePicker.date = NSDate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        print("Will Appear")
    }
}

