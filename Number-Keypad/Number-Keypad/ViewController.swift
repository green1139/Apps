//
//  ViewController.swift
//  Number-Keypad
//
//  Created by Siddhant Pagariya on 21 Dec 2015.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClicked(sender:AnyObject)
    {
        print(((sender as! UIButton).titleLabel?.text)!)
    }
    @IBAction func btnHeld(sender: UILongPressGestureRecognizer)
    {
        print("+")
    }
    @IBAction func btn0clicked(sender: UITapGestureRecognizer)
    {
        print("0")
    }
}

