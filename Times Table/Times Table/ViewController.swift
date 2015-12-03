//
//  ViewController.swift
//  Times Table
//
//  Created by Siddhant Pagariya on 6/10/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    var tables = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    var currentMaxMult = 20
    
    @IBOutlet weak var slider: UISlider!
    @IBAction func sliderChanged(sender: AnyObject)
    {
        tables = [Int]()
        let val = Int(slider.value)
        for (var i = 1; i <= currentMaxMult; i++)
        {
            tables.append(val*i)
        }
        table.reloadData()
        self.navigationController?.navigationBar.topItem?.title = "Times Tables: \(val)x\(currentMaxMult)"
        numberTimesTable.text = "\(val)"
        multiple.text = "\(currentMaxMult)"
    }
    
    var num = 0, mult = 0
    
    @IBOutlet weak var numberTimesTable: UITextField!
    @IBOutlet weak var multiple: UITextField!
    @IBAction func goToTimesTable(sender: AnyObject) {
        if (numberTimesTable.text != "" && multiple.text != "" && Int(numberTimesTable.text!) != 0 && Int(multiple.text!) != 0)
        {
            num = Int(numberTimesTable.text!)!
            if (num > Int(slider.maximumValue))
            {
                slider.maximumValue = Float(num)
            }
            mult = Int(multiple.text!)!
            if (mult > currentMaxMult)
            {
                currentMaxMult = mult
            }
            if (num < Int(slider.maximumValue))
            {
                slider.maximumValue = Float(num)
            }
            if (mult < currentMaxMult)
            {
                currentMaxMult = mult
            }
            slider.value = Float(num)
            tables.removeAll()
            for (var i = 1; i <= currentMaxMult; i++)
            {
                tables.append(num*i)
            }
            table.reloadData()
            table.selectRowAtIndexPath(NSIndexPath(forRow: mult-1, inSection: 0), animated: true, scrollPosition: UITableViewScrollPosition.Bottom)
            self.navigationController?.navigationBar.topItem?.title = "Times Tables: \(num)x\(mult)"
        }
        numberTimesTable.resignFirstResponder()
        multiple.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = "\(tables[indexPath.row])"
        cell.detailTextLabel!.text = "\(Int(slider.value))x\(indexPath.row + 1)"
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tables.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let VC = storyboard?.instantiateViewControllerWithIdentifier("ViewCellViewController")
        cellMult  = indexPath.row + 1
        cellNum = Int(slider.value)
        self.navigationController?.pushViewController(VC!, animated: true)
    }
}

