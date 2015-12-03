//
//  MainTabViewController.swift
//  Conjuguemos
//
//  Created by Siddhant Pagariya on 10/5/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit
import SCLAlertView

class MainTabViewController: UITabBarController {
    
    override func viewWillAppear(animated: Bool) {
        if var language = (NSUserDefaults.standardUserDefaults().objectForKey("language") as? String)
        {
            language = (language)
            switch language
            {
                /**case "Spanish":
                languageToLearn = "Spanish"
                for (var i=0; i<4; i++)
                {
                self.tabBar.items![i].enabled = true
                }**/
                
            case "French":
                languageToLearn = "French"
                if (self.viewControllers!.count != 5)
                {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewControllerWithIdentifier("GrammarNav") as UIViewController
                    self.viewControllers?.insert(vc, atIndex: 3)
                }
                
            case "Latin":
                languageToLearn = "Latin"
                if (self.viewControllers?.count == 5)
                {
                    self.viewControllers?.removeAtIndex(3)
                }
                
            case "German":
                languageToLearn = "German"
                if (self.viewControllers?.count == 5)
                {
                    self.viewControllers?.removeAtIndex(3)
                }
                
            case "Portuguese":
                languageToLearn = "Portuguese"
                if (self.viewControllers?.count == 5)
                {
                    self.viewControllers?.removeAtIndex(3)
                }
                
            case "Italian":
                languageToLearn = "Italian"
                if (self.viewControllers?.count == 5)
                {
                    self.viewControllers?.removeAtIndex(3)
                }
                
            default:
                languageToLearn = "Spanish"
                if (self.viewControllers!.count != 5)
                {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewControllerWithIdentifier("GrammarNav") as UIViewController
                    self.viewControllers?.insert(vc, atIndex: 3)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tabBar.tintColor = UIColor(red:1, green:0.592, blue:0.334, alpha:1)
        self.tabBar.selectionIndicatorImage = UIImage(named: "Indicator")
        ///self.performSelector("welcomeScreenPresenting", withObject: self, afterDelay: 2)
    }
    
    /**func welcomeScreenPresenting()
     {
     if (NSUserDefaults.standardUserDefaults().objectForKey("firstOpening") == nil)
     {
     performSegueWithIdentifier("welcomeScreen", sender: self)
     }
     }**/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "welcomeScreen")
        {
            //print("Welcome screen being loaded.")
        }
    }
    
    /**override func viewControllerForUnwindSegueAction(action: Selector, fromViewController: UIViewController, withSender sender: AnyObject?) -> UIViewController? {
    let resultVC = self.selectedViewController?.viewControllerForUnwindSegueAction(action, fromViewController: fromViewController, withSender: sender)
    return resultVC
    }**/
}
