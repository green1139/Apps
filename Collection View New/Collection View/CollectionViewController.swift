//
//  CollectionViewController.swift
//  Collection View
//
//  Created by Siddhant Pagariya on 8/24/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

var phoneNumber = ""
class CollectionViewController: UICollectionViewController {
    @IBAction func backspace(sender: AnyObject) {
        if (phoneNumber != "")
        {
            phoneNumber = phoneNumber.substringToIndex(phoneNumber.endIndex.predecessor())
        }
        print("Phone Number: \(phoneNumber)")
    }
    @IBAction func clear(sender: AnyObject) {
        phoneNumber = ""
        print("Phone Number: \(phoneNumber)")
    }

    @IBAction func plus(sender: AnyObject) {
        phoneNumber = phoneNumber + "+"
        print("Phone Number: \(phoneNumber)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 12
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor(red: 13/255.0, green: 196/255.0, blue: 255/255.0, alpha: 1.0)
        cell.layer.cornerRadius = 37;
        if (indexPath.row < 9)
        {
            cell.button.setTitle("\(indexPath.row + 1)", forState: UIControlState.Normal)
            cell.button.setTitle("\(indexPath.row + 1)", forState: UIControlState.Highlighted)
        }
        else if (indexPath.row == 9)
        {
            cell.button.setTitle("*", forState: UIControlState.Normal)
            cell.button.setTitle("*", forState: UIControlState.Highlighted)
        }
        else if (indexPath.row == 10)
        {
            cell.button.setTitle("0", forState: UIControlState.Normal)
            cell.button.setTitle("0", forState: UIControlState.Highlighted)
        }
        else
        {
            cell.button.setTitle("#", forState: UIControlState.Normal)
            cell.button.setTitle("#", forState: UIControlState.Highlighted)
        }
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
