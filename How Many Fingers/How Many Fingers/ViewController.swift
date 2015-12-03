//
//  ViewController.swift
//  How Many Fingers
//
//  Created by Siddhant Pagariya on 6/8/15.
//  Copyright (c) 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func guess(sender: AnyObject) {
        
        let randNumber = arc4random_uniform(10) + 1
        let guessNum = Int(userInput.text!)
        if guessNum != nil
        {
            if Int(randNumber) == guessNum
            {
                resultLabel.text = "Correct! It was indeed \(guessNum!)."
            }
            else if (guessNum != Int(randNumber) && (guessNum <= 10 && guessNum >= 1))
            {
                resultLabel.text = "Nope. It was \(randNumber)!"
            }
            else
            {
                resultLabel.text = "Please enter a valid number: 1-10."
            }
        }
            
        else
        {
            resultLabel.text = "Please enter a valid number: 1-10."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.text = "Valid Number between 1 and 10, inclusive."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

