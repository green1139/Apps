//
//  ViewController.swift
//  Segment Animations
//
//  Created by Siddhant Pagariya on 8/30/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var oldSegment = 0
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var changingView: UIView!
    @IBAction func segmentChanged(sender: AnyObject) {
        if (segmentedControl.selectedSegmentIndex < oldSegment)
        {
            /*UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.changingView.center.x = self.view.center.x + self.changingView.center.x + self.changingView.center.x
                }, completion: { (bool) -> Void in
                    self.changingView.center.x = self.view.center.x
                    self.changingView.hidden = true
                    self.numberLabel.text = "\(self.segmentedControl.selectedSegmentIndex + 1)"
                    self.changingView.hidden = false
            })
            UIView.animateWithDuration(0.5, delay: 0.2, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                self.changingView.center.x = self.view.center.x + self.changingView.center.x + self.changingView.center.x
                }, completion: nil)*/
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.changingView.center.x = self.view.center.x + self.changingView.center.x + self.changingView.center.x
                }, completion: { (bool) -> Void in
                    self.changingView.center.x = self.view.center.x - self.changingView.center.x
                    UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                        self.changingView.center.x = self.view.center.x
                        }, completion: nil)
                    self.changingView.hidden = true
                    self.numberLabel.text = "\(self.segmentedControl.selectedSegmentIndex + 1)"
                    self.changingView.hidden = false
            })
        }
        else if (segmentedControl.selectedSegmentIndex > oldSegment)
        {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.changingView.center.x = self.view.center.x - self.changingView.center.x - self.changingView.center.x
                }, completion: { (bool) -> Void in
                    self.changingView.center.x = self.view.center.x - self.changingView.center.x - self.changingView.center.x
                    UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                        self.changingView.center.x = self.view.center.x
                        }, completion: nil)
                    self.changingView.hidden = true
                    self.numberLabel.text = "\(self.segmentedControl.selectedSegmentIndex + 1)"
                    self.changingView.hidden = false
            })
        }
        oldSegment = segmentedControl.selectedSegmentIndex
    }
    @IBOutlet weak var numberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        segmentedControl.selectedSegmentIndex = 0
        numberLabel.text = "\(segmentedControl.selectedSegmentIndex + 1)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

