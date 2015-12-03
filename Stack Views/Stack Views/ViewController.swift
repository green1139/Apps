//
//  ViewController.swift
//  Stack Views
//
//  Created by Siddhant Pagariya on 8/29/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

var number = ""
class ViewController: UIViewController {

    @IBAction func numButtonPressed(sender: UIButton) {
        number += "\(sender.titleLabel!.text!)"
        updateNumber()
    }
    @IBAction func backspace(sender: AnyObject) {
        if (number != "")
        {
            number = number.substringToIndex(number.endIndex.predecessor())
        }
        updateNumber()
    }
    @IBAction func plusSign(sender: AnyObject) {
        if (number.startIndex == number.endIndex)
        {
            number += "+"
        }
        updateNumber()
    }
    @IBAction func clear(sender: AnyObject) {
        number = ""
        updateNumber()
    }
    func updateNumber()
    {
        self.navigationItem.title = number
        print("Number: \(number)")
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

