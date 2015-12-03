//
//  SettingsViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 6/21/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tabBarHiddenSwitch: UISwitch!
    
    @IBAction func tabBarButtonChanged(sender: AnyObject) {
        if (tabBarHiddenSwitch.on)
        {
            tabBarHidden = true
            NSUserDefaults.standardUserDefaults().setObject(tabBarHidden, forKey: "tabBarHidden")
        }
        else
        {
            tabBarHidden = false
            NSUserDefaults.standardUserDefaults().setObject(tabBarHidden, forKey: "tabBarHidden")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if (NSUserDefaults.standardUserDefaults().objectForKey("tabBarHidden") != nil)
        {
            tabBarHidden = NSUserDefaults.standardUserDefaults().objectForKey("tabBarHidden") as! Bool
        }
        else
        {
            NSUserDefaults.standardUserDefaults().setObject(tabBarHidden, forKey: "tabBarHidden")
        }
        self.tabBarController?.tabBar.hidden = tabBarHidden
        if (tabBarHidden)
        {
            tabBarHiddenSwitch.setOn(true, animated: true)
        }
        else
        {
            tabBarHiddenSwitch.setOn(false, animated: true)
        }
    }
}
