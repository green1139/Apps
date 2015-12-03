//
//  CollectionViewCell.swift
//  Collection View
//
//  Created by Siddhant Pagariya on 8/24/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var number: UIButton!
    var button:UIButton!
    var hold = false
    override init(frame: CGRect) {
        button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        button.setTitle("0", forState: UIControlState.Normal)
        button.setTitle("0", forState: UIControlState.Highlighted)
        button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: CGFloat(45))
        super.init(frame: frame)
        contentView.addSubview(button)
        button.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @IBAction func tapped(sender: AnyObject) {
        print("tapped")
    }
    func pressed(sender: UIButton!)
    {
        let buttonString = sender.titleLabel?.text!
        phoneNumber = phoneNumber + buttonString!
        
        print("Phone Number: \(phoneNumber)")
    }
}
