//
//  WelcomeScreenViewController.swift
//  Conjuguemos
//
//  Created by Siddhant Pagariya on 10/28/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class WelcomeScreenViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let languages = ["Spanish", "French", "Latin", "German", "Portugese", "Italian"]
    
    @IBOutlet weak var languagePicker: UIPickerView!
    
    @IBAction func doneAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        languagePicker.dataSource = self
        languagePicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return languages.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return (languages[row])
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        ///print(segue.destinationViewController)
    }
}
