//
//  BellTimingsViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 6/18/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class BellTimingsViewController: UIViewController {

    var index = 0
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func segmentChanged(sender: AnyObject) {
        let seg = segmentedControl.selectedSegmentIndex
        switch seg
        {
            case 0: imageView.image = UIImage(named: "E_Full")
            case 1: imageView.image = UIImage(named: "E_Half")
            case 2: imageView.image = UIImage(named: "MH_Full")
            case 3: imageView.image = UIImage(named: "MH_Half")
            default: imageView.image = UIImage(named: "E_Full")
        }
    }
    @IBAction func swipeRight(sender: AnyObject) {
        index++
        if(index > 3)
        {
            index = 0
        }
        segmentedControl.selectedSegmentIndex = index
        segmentChanged(self)
    }
    @IBAction func swipeLeft(sender: AnyObject) {
        index--
        if(index < 0)
        {
            index = 3
        }
        segmentedControl.selectedSegmentIndex = index
        segmentChanged(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
