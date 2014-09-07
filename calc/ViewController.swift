//
//  ViewController.swift
//  calc
//
//  Created by CHRISTOPHER HINRICHS on 9/2/14.
//  Copyright (c) 2014 CHRISTOPHER HINRICHS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var billInputField: UITextField!
    @IBOutlet weak var tipPercentage: UISegmentedControl!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipAmount: UILabel!

    var defaultTip : Int = 20;
    
    @IBAction func billChanged(sender: AnyObject) {
        if billInputField.hasText() {
            let billVal = (billInputField.text as NSString).doubleValue
            let tipLabel = tipPercentage.titleForSegmentAtIndex(tipPercentage.selectedSegmentIndex)
            let tipPercent = (tipLabel! as NSString).doubleValue * 0.01
            let tip = billVal * tipPercent
            let format = "%.2f"
            
            tipAmount.text = "$\(NSString(format: format, tip))"
            totalAmount.text = "$\(NSString(format: format, billVal + tip))"
            
        } else {
            tipAmount.text = "$0.00"
            totalAmount.text = "$0.00"
        }
    }
    @IBAction func tipPercentChanged(sender: AnyObject) {
        self.billChanged(sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        if defaults.objectForKey(SETTINGS_PERCENT_KEY) != nil {
            defaultTip = defaults.integerForKey(SETTINGS_PERCENT_KEY)
        }
        
        for var i = 0; i < tipPercentage.numberOfSegments; i++ {
            var percent = tipPercentage.titleForSegmentAtIndex(i)
            if ((percent! as NSString).integerValue == defaultTip) {
                tipPercentage.selectedSegmentIndex = i
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapHandler(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }

}

