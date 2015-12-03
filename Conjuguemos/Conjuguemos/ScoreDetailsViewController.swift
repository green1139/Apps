//
//  ScoreDetailsViewController.swift
//  Conjuguemos
//
//  Created by Siddhant Pagariya on 11/27/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ScoreDetailsViewController: UIViewController {

    var selectedRow:Int!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBAction func done(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        typeLabel.text = scores[selectedRow]["Type"]
        typeLabel.layer.shadowColor = UIColor.yellowColor().CGColor
        typeLabel.layer.shadowOpacity = 1.0
        typeLabel.layer.shadowRadius = 2
        typeLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        titleLabel.text = scores[selectedRow]["Title"]
        titleLabel.layer.shadowColor = UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1).CGColor
        titleLabel.layer.shadowOpacity = 1.0
        titleLabel.layer.shadowRadius = 2
        titleLabel.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        scoreLabel.text = "  " + "Score: " + scores[selectedRow]["Score"]! + "  "
        doneButton.layer.shadowOpacity = 0.6
        doneButton.layer.shadowRadius = 10.0
        doneButton.layer.shadowColor = UIColor.yellowColor().CGColor
        doneButton.layer.shadowOffset = CGSize(width: 0, height: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
