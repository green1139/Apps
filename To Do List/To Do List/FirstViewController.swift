//
//  FirstViewController.swift
//  To Do List
//
//  Created by Siddhant Pagariya on 6/20/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

var toDoList = [String]()
class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBAction func editFunction(sender: AnyObject)
    {
        if (editButton.title == "Edit")
        {
            table.editing = true
            editButton.title = "Done"
            editButton.style = UIBarButtonItemStyle.Done
        }
        else if (editButton.title == "Done")
        {
            table.editing = false
            editButton.title = "Edit"
            editButton.style = UIBarButtonItemStyle.Plain
        }
    }
    @IBAction func addFunction(sender: AnyObject)
    {
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if (NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil)
        {
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
        else
        {
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        }
        table.reloadData()
    }
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(true)
        if (NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil)
        {
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
        else
        {
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        }
        table.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return toDoList.count
    }
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String?
    {
        return "Delete?"
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if (editingStyle == UITableViewCellEditingStyle.Delete)
        {
            toDoList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            table.reloadData()
            if (toDoList.count == 0)
            {
                table.editing = false
                editButton.title = "Edit"
                editButton.style = UIBarButtonItemStyle.Plain
            }
        }
    }
}

