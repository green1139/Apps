//
//  PopUpViewController.swift
//  Conjuguemos
//
//  Created by Siddhant Pagariya on 10/5/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    var error = false
    var message = ""
    @IBOutlet weak var CustomAlertView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var alertLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.performSelector("dismiss", withObject: self, afterDelay: 1.25)
    }
    override func viewWillAppear(animated: Bool) {
        if (error)
        {
            imageView.image = UIImage(named: "Cross.png")
        }
        else
        {
            imageView.image = UIImage(named: "Check.png")
        }
        alertLabel.text = message
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismiss()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
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
