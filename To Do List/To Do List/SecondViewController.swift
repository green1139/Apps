//
//  SecondViewController.swift
//  To Do List
//
//  Created by Siddhant Pagariya on 6/20/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var toDoListItemText: UITextField!
    @IBAction func addItem(sender: AnyObject) {
        let text = toDoListItemText.text
        toDoList.append(text!)
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (toDoListItemText.text != nil && toDoListItemText.text != "")
        {
            addItem(self)
        }
        return true
    }
}

