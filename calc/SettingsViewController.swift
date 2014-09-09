//
//  SettingsViewController.swift
//  calc
//
//  Created by CHRISTOPHER HINRICHS on 9/6/14.
//  Copyright (c) 2014 CHRISTOPHER HINRICHS. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    
    var items: [Int] = [18, 20, 22]
    var defaultTip = 20
    var selectedRow:UITableViewCell?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tblView.dataSource = self
        tblView.delegate = self
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        if defaults.objectForKey(SETTINGS_PERCENT_KEY) != nil {
            defaultTip = defaults.integerForKey(SETTINGS_PERCENT_KEY)
        }
        
    }
    
    @IBAction func saveSettings(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell")
        let percentVal = self.items[indexPath.row]
        cell.textLabel!.text = String(percentVal) + "%"
        if percentVal == defaultTip {
            selectedRow = cell
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        return cell
    }

    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        defaultTip = self.items[indexPath.row]
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTip, forKey: SETTINGS_PERCENT_KEY)
        defaults.synchronize()
        selectedRow!.accessoryType = UITableViewCellAccessoryType.None
        selectedRow = tableView.cellForRowAtIndexPath(indexPath)
        selectedRow!.accessoryType = UITableViewCellAccessoryType.Checkmark
        return nil
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
