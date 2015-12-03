//
//  ViewCellViewController.swift
//  Times Table
//
//  Created by Siddhant Pagariya on 6/26/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

var cellNum = 1, cellMult = 1
class ViewCellViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var content: UILabel!
    var contentMinX = 0, contentMinY = 0, contentWidth = 0, contentHeight = 0
    /*override func viewDidLoad() {
        Label.center = CGPointMake(Label.center.x-400, Label.center.y)
        content.center = CGPointMake(content.center.x, content.center.y-700)
    }*/
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(2.0, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.content.text = "\(cellNum * cellMult)"
            self.content.center = CGPointMake(self.content.center.x, self.content.center.y+100)
            }, completion: nil)
        UIView.animateWithDuration(0.5) { () -> Void in
            //self.content.text = "\(cellNum * cellMult)"
            //self.content.center = CGPointMake(self.Label.center.x+1000, self.Label.center.y)
            self.Label.text = "\(cellNum)x\(cellMult)"
            self.Label.center = CGPointMake(self.Label.center.x+400, self.Label.center.y)
        }
    }
    override func viewWillLayoutSubviews() {
        
        //content.center = CGPointMake(content.center.x-1000, content.center.y)
        Label.center = CGPointMake(Label.center.x-400, Label.center.y)
    }
}
