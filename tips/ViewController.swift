//
//  ViewController.swift
//  tips
//
//  Created by Daniel Trostli on 3/1/15.
//  Copyright (c) 2015 Trostli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dollarSignLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var inputTipView: UIView!
    
    @IBOutlet weak var totalLabel4: UILabel!
    @IBOutlet weak var totalLabel3: UILabel!
    @IBOutlet weak var totalLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tipView.alpha = 0
        self.inputTipView.center.y = self.view.center.y
        self.billField.becomeFirstResponder()
        self.tipView.center.y += self.view.bounds.height

        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipLevel = defaults.integerForKey("defaultTipLevel")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipLevel = defaults.integerForKey("defaultTipLevel")
        tipControl.selectedSegmentIndex = defaultTipLevel
        
        var selectedColorTheme = defaults.integerForKey("selectedColorTheme")
        if selectedColorTheme == 0 {
            self.navigationController?.navigationBar.barStyle = UIBarStyle.Default
            self.view.backgroundColor = UIColor.whiteColor()
            self.billField.tintColor = UIColor.blackColor()
        } else {
            self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
            self.view.backgroundColor = UIColor.darkGrayColor()
            self.billField.tintColor = UIColor.whiteColor()
        }

    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        if billField.text == "" {
            self.dollarSignLabel.hidden = false
            UIView.animateWithDuration(0.3, animations: {
                // This causes first view to fade in and second view to fade out
                self.inputTipView.center.y = self.view.center.y
                self.tipView.alpha = 0
                self.tipView.center.y += self.view.bounds.height
            })
        } else {
            self.dollarSignLabel.hidden = true
            UIView.animateWithDuration(0.3, animations: {
                // This causes first view to fade in and second view to fade out
                self.inputTipView.center.y = self.view.bounds.height / 5.5
                self.tipView.alpha = 1
                self.tipView.center.y = self.view.bounds.height / 1.55
            })
        }
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var total2 = total / 2
        var total3 = total / 3
        var total4 = total / 4
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalLabel2.text = String(format: "$%.2f", total2)
        totalLabel3.text = String(format: "$%.2f", total3)
        totalLabel4.text = String(format: "$%.2f", total4)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onEditingDidBeging(sender: AnyObject) {

    }

}

