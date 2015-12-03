//
//  ViewScoresViewController.swift
//  Conjuguemos
//
//  Created by Siddhant Pagariya on 11/27/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

var scores:[[String: String]] = []
func addNewScoreEntry(scoreType:String!, title:String!, score:String!)
{
    scores = NSUserDefaults.standardUserDefaults().objectForKey("scoresList") as! [[String:String]]
    let arrayOfScoreElements:[String:String]! = ["Type":scoreType, "Title":title, "Score":score]
    scores.append(arrayOfScoreElements)
    NSUserDefaults.standardUserDefaults().setObject(scores, forKey: "scoresList")
    ///print(NSUserDefaults.standardUserDefaults().objectForKey("scoresList") as! [[String:String]])
}
class ViewScoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedCellRow = 0
    @IBOutlet weak var scoresCount: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func dismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func editTable(sender: AnyObject!)
    {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 30.0, initialSpringVelocity: 8.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.tableView.editing = !self.tableView.editing
            }, completion: nil)
        if (self.tableView.editing)
        {
            editButton.title = "Done"
        }
        else
        {
            editButton.title = "Edit"
        }
    }
    @IBAction func clearAll(sender: AnyObject!)
    {
        scores.removeAll()
        NSUserDefaults.standardUserDefaults().setObject(scores, forKey: "scoresList")
        refreshData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if (NSUserDefaults.standardUserDefaults().objectForKey("scoresList") != nil)
        {
            scores = NSUserDefaults.standardUserDefaults().objectForKey("scoresList") as! [[String: String]]
        }
        else
        {
            NSUserDefaults.standardUserDefaults().setObject(scores, forKey: "scoresList")
        }
        ///addNewScoreEntry("Conjugation (Portuguese)", title: "Just Like That", score: "\(rand())")
        refreshData()
        editButton.title = "Edit"
        self.tableView.editing = false
        scoresCount.title = "Count: \(scores.count)"
        self.tableView.tableFooterView = UIView()
    }
    override func viewWillAppear(animated: Bool) {
        animateTable()
    }
    func animateTable() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animateWithDuration(2, delay: 0.05 * Double(index), usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index++
        }
    }
    func refreshData()
    {
        self.tableView.reloadData()
        scoresCount.title = "Count: \(scores.count)"
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return scores.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Score")!
        cell.textLabel!.text = scores[indexPath.row]["Type"]!
        cell.textLabel!.frame.size.width = 4
        cell.detailTextLabel!.text = "              " + scores[indexPath.row]["Title"]! + " : " + scores[indexPath.row]["Score"]!
        cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        cell.layoutMargins = UIEdgeInsetsZero
        return cell
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete)
        {
            scores.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Bottom)
            scoresCount.title = "Count: \(scores.count)"
            NSUserDefaults.standardUserDefaults().setObject(scores, forKey: "scoresList")
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedCellRow = indexPath.row
        ///prepareForSegue(UIStoryboardSegue(identifier: "selectedScoreCell", source: ViewScoresViewController(), destination: ScoreDetailsViewController()), sender: self)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier("selectedScoreCell", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "selectedScoreCell")
        {
            let vc = segue.destinationViewController as! ScoreDetailsViewController
            vc.selectedRow = selectedCellRow
        }
    }
    
}
