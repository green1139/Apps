//
//  HomeViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 6/20/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit
var tabBarHidden = true
class HomeViewController: UIViewController {

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
    }
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(true)
        if (NSUserDefaults.standardUserDefaults().objectForKey("tabBarHidden") != nil)
        {
            tabBarHidden = NSUserDefaults.standardUserDefaults().objectForKey("tabBarHidden") as! Bool
        }
        else
        {
            NSUserDefaults.standardUserDefaults().setObject(tabBarHidden, forKey: "tabBarHidden")
        }
        self.tabBarController?.tabBar.hidden = tabBarHidden
    }
}
