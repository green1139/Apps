//
//  TableViewController.swift
//  Custom Table View Cells
//
//  Created by Siddhant Pagariya on 8/1/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet weak var navigationBar: UINavigationBar!
    var arr = [1,2,3,4,5,6,7,8,9,10]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell

        // Configure the cell...
        cell.label.text = "⇌\(arr[indexPath.row])⇌"
        cell.textField.text = "Row \(arr[indexPath.row])"
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
            arr.removeAtIndex(indexPath.row)
            for (var i=0; i<arr.count; i++)
            {
                arr[i] = i+1
            }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            //tableView.reloadData()
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            arr.insert(1001, atIndex: indexPath.row)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Bottom)
        }
    }

    @IBAction func Add(sender: AnyObject) {
        arr.insert(arr.count+1, atIndex: arr.count)
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: arr.count-1, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Automatic)
    }

    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let temp = arr[fromIndexPath.row]
        arr.removeAtIndex(fromIndexPath.row)
        arr.insert(temp, atIndex: toIndexPath.row)
        
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        tableView.reloadData()
        print(arr)
    }
}
