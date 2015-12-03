//
//  ViewController.swift
//  Is It Prime
//
//  Created by Siddhant Pagariya on 6/9/15.
//  Copyright (c) 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func isItPrime(sender: AnyObject)
    {
        let num = Int(userInput.text!)
        if (num != nil && num>=0)
        {
            var isPrime = true
            
            if (num == 1 || num == 0)
            {
                isPrime = false
            }
        
            for (var i = 2; i < num; i++)
            {
                if ((num!)%i == 0)
                {
                    isPrime = false
                    break
                    }
            }
            
            if (isPrime)
            {
                resultLabel.text = "\(num!) is Prime."
            }
                
            else
            {
                resultLabel.text = "\(num!) is not Prime."
            }
        }
        else
        {
            resultLabel.text = "Please enter a valid positive number."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

