//
//  SubjectTableViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 6/30/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

var isChanging = false
var subjects:[Dictionary<String, AnyObject>] = [["subject":String(), "hour": String(), "red": Float(), "green": Float(), "blue": Float()]]
class SubjectTableViewController: UITableViewController {

    @IBOutlet var table: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBAction func editTable(sender: AnyObject) {
        /*UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                self.editing = !self.editing
                if (self.editing)
                {
                    self.editButton.title = "Done"
                    //print("Done")
                }
                else
                {
                    self.editButton.title = "Edit"
                    //print("Edit")
                }
            }, completion: nil)*/
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 5, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.editing = !self.editing
            }, completion: nil)
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.editButton.title = ""
            }, completion: nil)
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            if (self.editing)
            {
                self.editButton.title = "Done"
                //print("Done")
            }
            else
            {
                self.editButton.title = "Edit"
                //print("Edit")
            }
            }, completion: nil)
        /*self.editing = !self.editing
        if (self.editing)
        {
            editButton.title = "Done"
            //print("Done")
        }
        else
        {
            editButton.title = "Edit"
            //print("Edit")
        }*/
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.tableView.separatorInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        self.tableView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        ///self.navigationItem.leftBarButtonItem = self.editButtonItem()
        if (NSUserDefaults.standardUserDefaults().objectForKey("subjects") != nil)
        {
            subjects = NSUserDefaults.standardUserDefaults().objectForKey("subjects") as! [Dictionary<String, AnyObject>]
            //print(subjects)
        }
        else
        {
            subjects.removeAll()
            NSUserDefaults.standardUserDefaults().setObject(subjects, forKey: "subjects")
            //print("added: \(subjects)")
        }
        ///NSUserDefaults.standardUserDefaults().removeObjectForKey("subjects")
        table.reloadData()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        ///self.navigationItem.leftBarButtonItem = self.editButtonItem()
        if (NSUserDefaults.standardUserDefaults().objectForKey("subjects") != nil)
        {
            subjects = NSUserDefaults.standardUserDefaults().objectForKey("subjects") as! [Dictionary<String, AnyObject>]
            //print(subjects)
        }
        else
        {
            subjects.removeAll()
            NSUserDefaults.standardUserDefaults().setObject(subjects, forKey: "subjects")
            //print("added: \(subjects)")
        }
        ///NSUserDefaults.standardUserDefaults().removeObjectForKey("subjects")
        table.reloadData()
        //editButton = self.editButtonItem()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subjects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SubjectCell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel!.text = (subjects[indexPath.row]["subject"]) as? String
        cell.detailTextLabel!.text = (subjects[indexPath.row]["hour"]) as? String
        cell.backgroundColor = UIColor(red: CGFloat((subjects[indexPath.row]["red"]) as! Float), green: CGFloat((subjects[indexPath.row]["green"]) as! Float), blue: CGFloat((subjects[indexPath.row]["blue"]) as! Float), alpha: CGFloat(1))
        ///cell.textLabel?.textColor = UIColor(red: CGFloat((subjects[indexPath.row]["red"]) as! Float), green: CGFloat((subjects[indexPath.row]["green"]) as! Float), blue: CGFloat((subjects[indexPath.row]["blue"]) as! Float), alpha: CGFloat(1))
        ///print("\(cell.textLabel?.textColor) and \(cell.backgroundColor)")
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            subjects.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(subjects, forKey: "subjects")
            table.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        rowIndex = indexPath.row
        changingDict = subjects[rowIndex]
        isChanging = true
        ///print("isChanging: \(isChanging)")
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let fromDict = subjects[sourceIndexPath.row]
        subjects.removeAtIndex(sourceIndexPath.row)
        subjects.insert(fromDict, atIndex: destinationIndexPath.row)
        NSUserDefaults.standardUserDefaults().setObject(subjects, forKey: "subjects")
        print("From: \(sourceIndexPath.row) To: \(destinationIndexPath.row)")
        table.reloadData()
    }
}
