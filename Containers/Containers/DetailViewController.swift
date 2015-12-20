//
//  DetailViewController.swift
//  Containers
//
//  Created by Siddhant Pagariya on 19 Dec 2015.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer)
    {
        let translation:CGPoint = recognizer.translationInView(self.view)
        recognizer.view!.center = CGPointMake(recognizer.view!.center.x + translation.x,
            recognizer.view!.center.y)
        recognizer.setTranslation(CGPointMake(0, 0), inView: self.view)
    }
    @IBAction func dismissTheViewController(recognizer:UITapGestureRecognizer)
    {
        self.resignFirstResponder()
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
