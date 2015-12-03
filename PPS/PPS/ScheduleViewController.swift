//
//  ScheduleViewController.swift
//  PPS
//
//  Created by Siddhant Pagariya on 6/15/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

var schedule = [["title":String(), "subtitle":String()]]
var cellRow = 0
class ScheduleViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var scheduleTable: UITableView!
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return schedule.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "ScheduleCell")
        cell.textLabel!.text = schedule[indexPath.item]["title"]
        cell.detailTextLabel!.text = schedule[indexPath.item]["subtitle"]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        self.viewDidAppear(true)
        if (NSUserDefaults.standardUserDefaults().objectForKey("schedule") != nil)
        {
            schedule = NSUserDefaults.standardUserDefaults().objectForKey("schedule") as! [[String:String]]
        }
        else
        {
            schedule.removeAll()
            NSUserDefaults.standardUserDefaults().setObject(schedule, forKey: "schedule")
        }
        scheduleTable.reloadData()
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if (editingStyle == UITableViewCellEditingStyle.Delete)
        {
            schedule.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(schedule, forKey: "schedule")
            scheduleTable.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let VC = storyboard?.instantiateViewControllerWithIdentifier("ChangeHourViewController")
        cellRow = indexPath.row
        self.navigationController?.pushViewController(VC!, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
