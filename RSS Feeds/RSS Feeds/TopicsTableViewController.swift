//
//  TopicsTableViewController.swift
//  RSS Feeds
//
//  Created by Siddhant Pagariya on 8/16/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

var selectedRow = 0
var updates = [String()]

class TopicsTableViewController: UITableViewController {

    override func viewWillAppear(animated: Bool) {
        updates.removeAll()
        let url = NSURL(string: "https://sites.google.com/site/portagepublicschoolsupdates/updates")
        
        if url != nil {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
                
                var urlError = false
                
                if error == nil {
                    let urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding) as NSString!
                    //print(urlContent)
                    let urlContentArray = urlContent.componentsSeparatedByString("<div dir=\"ltr\">")
                    //print(urlContentArray[1])
                    //let secondUrlContentArray = urlContentArray[1].componentsSeparatedByString("<span style=\"font-size:13.3333px;line-height:normal\">")
                    //let thirdUrlContentArray = secondUrlContentArray[1].componentsSeparatedByString("<div style=\"font-size:13.3333px;line-height:normal\">")
                    let secondURLContentArray = urlContentArray[1].componentsSeparatedByString("<div style=\"font-size:13.3333px;line-height:normal\">")
                    //print(thirdUrlContentArray)
                    for (var i=1; i < secondURLContentArray.count; i++)
                    {
                        let array = secondURLContentArray[i].componentsSeparatedByString("</div>")
                        let thirdURLArray = (array[0].componentsSeparatedByString("~ "))
                        //print("\(thirdURLArray[0]) : \(thirdURLArray[1])")
                        let update = thirdURLArray[1]
                        updates.append(update)
                    }
                }
                else
                {
                    urlError = true
                }
                dispatch_async(dispatch_get_main_queue()) {
                    if urlError == true
                    {
                        print("error")
                    }
                    else
                    {
                        //print("no error")
                        print(updates)
                    }
                }
            })
            task.resume()
        }
        else
        {
            print("error")
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return updates.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        cell.textLabel?.text = "Announcement \(indexPath.row + 1)"
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedRow = indexPath.row
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("Moving")
    }

}
