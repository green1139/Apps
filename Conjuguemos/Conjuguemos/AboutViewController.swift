//
//  AboutViewController.swift
//  Conjuguemos
//
//  Created by Siddhant Pagariya on 10/10/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBAction func dismiss(sender: AnyObject) {
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
    
    override func viewWillAppear(animated: Bool) {
        ///(self.navigationController!.tabBarController!.tabBar.items!)[1].badgeValue = nil
        ///(self.navigationController!.tabBarController!.tabBar.items!)[2].badgeValue = nil
        ///(self.navigationController!.tabBarController!.tabBar.items!)[3].badgeValue = nil
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
