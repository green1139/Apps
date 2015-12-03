//
//  MapsTableViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 7/3/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

let maps:[Dictionary<String, String>] = [["school":"12th Street Elementary", "address":""], ["school":"Amberly Elementary", "address":""], ["school":"Angling Elementary", "address":""], ["school":"Central Elementary", "address":""], ["school":"Haverhill Elementary", "address":""], ["school":"Lake Center Elementary", "address":""], ["school":"Moorsbridge Elementary", "address":""], ["school":"Woodland Elementary", "address":""], ["school":"Central Middle", "address":""], ["school":"North Middle", "address":""], ["school":"West Middle", "address":""], ["school":"Central High", "address":""], ["school":"Community High", "address":""], ["school":"Northern High", "address":""]]
var selectedSchool = ""
class MapsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
        return maps.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MapCell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = maps[indexPath.row]["school"]
        cell.detailTextLabel?.text = maps[indexPath.row]["address"]
        let str = maps[indexPath.row]["school"]
        
        ///print(str?.componentsSeparatedByString("Elementary"))
        ///print(str?.componentsSeparatedByString("Middle"))
        ///print(str?.componentsSeparatedByString("High"))
        
        ///print("\(indexPath.row): ", appendNewline: false)
        if (str!.componentsSeparatedByString("Elementary").count > 1)
        {
            ///print("Elementary")
            cell.textLabel?.textColor = UIColor(red: 1.0, green: 0.3, blue: 0.0, alpha: 1.0)
        }
        else if (str!.componentsSeparatedByString("Middle").count > 1)
        {
            ///print("Middle")
            cell.textLabel?.textColor = UIColor(red: 0.0, green: 0.7, blue: 0.0, alpha: 1.0)
        }
        else if (str!.componentsSeparatedByString("High").count > 1)
        {
            ///print("High")
            cell.textLabel?.textColor = UIColor(red: 0.0, green: 0.4, blue: 1.0, alpha: 1.0)
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedSchool = maps[indexPath.row]["school"]!
    }
}
