//
//  SecondViewController.swift
//  Sample Animations
//
//  Created by Siddhant Pagariya on 6/28/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

var message = ""
class SecondViewController: UIViewController {

    @IBOutlet weak var save: UIBarButtonItem!
    @IBOutlet weak var cancel: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    @IBAction func back(sender: AnyObject)
    {
        if (sender as! UIBarButtonItem == save)
        {
            message = textField.text!
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Came Back!")
    }
}
