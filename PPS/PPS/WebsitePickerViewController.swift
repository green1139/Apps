//
//  WebsitePickerViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 9/8/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class WebsitePickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    let websiteNames = ["HOME", "12th Street Elementary","Amberly Elementary","Angling Elementary","Central Elementry","Central High","Central Middle", "Community High", "Haverhill Elementary", "Lake Center Elementary", "Moorsbridge Elementary", "Northern High", "Northern Middle", "West Middle", "Woodland Elementary"]
    let websiteURLs = ["portageps.org",
        "portageps.org/schools/elementary/twl/",
        "portageps.org/schools/elementary/amb/",
        "portageps.org/schools/elementary/ang/",
        "portageps.org/schools/elementary/cel/",
        "portageps.org/schools/high/chs/",
        "portageps.org/schools/middle/cms/",
        "portageps.org/schools/high/cec/",
        "portageps.org/schools/elementary/hav/",
        "portageps.org/schools/elementary/lce/",
        "portageps.org/schools/elementary/mbe/",
        "portageps.org/schools/high/nhs/",
        "portageps.org/schools/middle/nms/",
        "portageps.org/schools/middle/wms/",
        "portageps.org/schools/elementary/wod/",
    ]
    @IBOutlet weak var websitePickerView: UIPickerView!
    
    @IBAction func goWebsite(sender: AnyObject) {
        websiteURL = NSURL(string: "https://www." + websiteURLs[websitePickerView.selectedRowInComponent(0)])
        websiteTitle = websiteNames[websitePickerView.selectedRowInComponent(0)]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        websitePickerView.delegate = self
        websitePickerView.reloadAllComponents()
        ///print("loaded", terminator: "")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return websiteNames.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return websiteNames[row]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
