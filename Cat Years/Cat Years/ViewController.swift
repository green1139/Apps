//
//  ViewController.swift
//  Cat Years
//
//  Created by Siddhant Pagariya on 6/7/15.
//  Copyright (c) 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Age: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func findOut(sender: AnyObject) {
        let enteredAge = Int(Age.text!)
        if (enteredAge != nil)
        {
            let catAge = enteredAge! * 7
            result.text = "The cat's age is \(catAge) in cat years."
        }
        else
        {
            result.text = "Please enter a valid integer greater than 0."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

