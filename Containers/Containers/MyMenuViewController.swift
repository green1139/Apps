//
//  MyMenuViewController.swift
//  Containers
//
//  Created by Siddhant Pagariya on 19 Dec 2015.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class MyMenuViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBAction func Cross(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        //self.view.frame = CGRectMake(0, 0, 100, 600)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissTheViewController(recognizer:UITapGestureRecognizer)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewWillLayoutSubviews() {
        button.frame = CGRectMake(0, 0, button.frame.height, button.frame.width)
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
