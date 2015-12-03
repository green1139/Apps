//
//  ViewController.swift
//  Date and Time
//
//  Created by Siddhant Pagariya on 6/29/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {

    let stringOptionsList = ["None", "Short", "Medium", "Long", "Full"]
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var datePicker: UIPickerView!
    @IBOutlet weak var timePicker: UIPickerView!
    @IBAction func goAction(sender: AnyObject) {
        let formatter = NSDateFormatter()
        if (datePicker.selectedRowInComponent(0) == 0)
        {
            formatter.dateStyle = NSDateFormatterStyle.NoStyle
        }
        else if (datePicker.selectedRowInComponent(0) == 1)
        {
            formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        }
        else if (datePicker.selectedRowInComponent(0) == 2)
        {
            formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        }
        else if (datePicker.selectedRowInComponent(0) == 3)
        {
            formatter.dateStyle = NSDateFormatterStyle.LongStyle
        }
        else
        {
            formatter.dateStyle = NSDateFormatterStyle.FullStyle
        }
        
        if (timePicker.selectedRowInComponent(0) == 0)
        {
            formatter.timeStyle = NSDateFormatterStyle.NoStyle
        }
        else if (timePicker.selectedRowInComponent(0) == 1)
        {
            formatter.timeStyle = NSDateFormatterStyle.ShortStyle
        }
        else if (timePicker.selectedRowInComponent(0) == 2)
        {
            formatter.timeStyle = NSDateFormatterStyle.MediumStyle
        }
        else if (timePicker.selectedRowInComponent(0) == 3)
        {
            formatter.timeStyle = NSDateFormatterStyle.LongStyle
        }
        else
        {
            formatter.timeStyle = NSDateFormatterStyle.FullStyle
        }
        let date = NSDate()
        label.text = formatter.stringFromDate(date)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /**let date = NSDate()
        let formatter = NSDateFormatter()
        //formatter.timeStyle = .ShortStyle
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        label.text = formatter.stringFromDate(date)
        //let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        //label.text = timestamp
        **/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 5
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return stringOptionsList[row]
    }
}

