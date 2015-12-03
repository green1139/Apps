//
//  TabViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 7/1/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
    
    var tabOrder = NSMutableArray(capacity: 8)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.tabBar.tintColor = UIColor(red: 255.0/255.0, green: 98.0/255.0, blue: 0.0/255.0, alpha: 1)
    }
    override func tabBar(tabBar: UITabBar, didEndCustomizingItems items: [UITabBarItem], changed: Bool) {
        tabOrder = NSMutableArray(capacity: 8)
        for (var i = 0; i < self.viewControllers!.count; i++)
        {
            ///print(self.viewControllers![i].title!)
            tabOrder.addObject(self.viewControllers![i].title!)
        }
        NSUserDefaults.standardUserDefaults().setObject(tabOrder, forKey: "tabOrder")
        ///print(self.viewControllers)
        ///print(self.viewControllers?.count)
    }
    override func viewWillAppear(animated: Bool) {
        if (NSUserDefaults.standardUserDefaults().objectForKey("tabOrder") != nil)
        {
            let orderArray = NSUserDefaults.standardUserDefaults().objectForKey("tabOrder") as! NSArray as? [String]
            tabOrder = NSMutableArray(array: orderArray!)
            //print(tabOrder)
            var VCs: [UIViewController] = []
            for (var i = 0; i < tabOrder.count; i++)
            {
                for VC in self.viewControllers!
                {
                    if (VC.title! == (tabOrder[i] as! String))
                    {
                        VCs.append(VC)
                        ///print(VC.title!)
                    }
                }
            }
            self.viewControllers! = VCs
        }
    }
}
