//
//  AssignmentViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 6/15/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

var assignments = [["assignment":String(), "hour":String(), "index":Int()]]
var assignmentCellRow = 0
class AssignmentViewController: UIViewController {
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var assignmentTable: UITableView!
    @IBAction func editTable(sender: AnyObject) {
        
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.assignmentTable.editing = !self.assignmentTable.editing
            }, completion: nil)
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.editButton.title = ""
            }, completion: nil)
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            if (self.assignmentTable.editing)
            {
                self.editButton.title = "Done"
                print("Done")
            }
            else if (!self.assignmentTable.editing)
            {
                self.editButton.title = "Edit"
                print("Edit")
            }
            }, completion: nil)
        /*
        self.assignmentTable.editing = !self.assignmentTable.editing
        if (assignmentTable.editing)
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return assignments.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("AssignmentCell", forIndexPath: indexPath)
        cell.detailTextLabel!.text = (assignments[indexPath.item]["assignment"] as? String)
        cell.textLabel!.text = (assignments[indexPath.item]["hour"] as? String)! + ":"
        let subjectIndex = (assignments[indexPath.item]["index"] as? Int)!
        if (subjects.count >= subjectIndex+1)
        {
            cell.backgroundColor = UIColor(red: CGFloat((subjects[subjectIndex]["red"]) as! Float), green: CGFloat((subjects[subjectIndex]["green"]) as! Float), blue: CGFloat((subjects[subjectIndex]["blue"]) as! Float), alpha: CGFloat(1))
        }
        else
        {
            cell.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    // Override to support conditional editing of the table view.
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        if (NSUserDefaults.standardUserDefaults().objectForKey("assignments") != nil)
        {
            assignments = NSUserDefaults.standardUserDefaults().objectForKey("assignments") as! [Dictionary<String,AnyObject>]
        }
        else
        {
            assignments.removeAll()
            NSUserDefaults.standardUserDefaults().setObject(assignments, forKey: "assignments")
        }
        assignmentTable.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if (NSUserDefaults.standardUserDefaults().objectForKey("subjects") != nil)
        {
            subjects = NSUserDefaults.standardUserDefaults().objectForKey("subjects") as! [Dictionary<String, AnyObject>]
        }
        else
        {
            subjects.removeAll()
            NSUserDefaults.standardUserDefaults().setObject(subjects, forKey: "subjects")
        }
        assignmentTable.separatorColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        assignmentTable.separatorInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        assignmentTable.backgroundView?.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if (editingStyle == UITableViewCellEditingStyle.Delete)
        {
            assignments.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(assignments, forKey: "assignments")
            assignmentTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let VC = storyboard?.instantiateViewControllerWithIdentifier("ChangeAssignmentViewController")
        assignmentCellRow = indexPath.row
        self.navigationController?.pushViewController(VC!, animated: true)
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let dataToMove = assignments[sourceIndexPath.row]
        assignments.removeAtIndex(sourceIndexPath.row)
        assignments.insert(dataToMove, atIndex: destinationIndexPath.row)
        //print("From: \(sourceIndexPath.row) To: \(destinationIndexPath.row)")
        assignmentTable.reloadData()
    }
}
