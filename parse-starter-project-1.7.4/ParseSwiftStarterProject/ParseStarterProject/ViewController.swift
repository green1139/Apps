//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
//import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let testUser = PFObject(className: "KAMSCStudent")
        testUser["Name"] = "Siddhant Pagariya"
        var name = testUser["Name"]
        testUser["Age"] = 14
        testUser["Class_Of"] = 2018
        testUser.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if (success)
            {
                println("User \(name!) saved.")
            }
            else
            {
                println("User \(name!) was not saved.")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

