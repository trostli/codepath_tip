//
//  SettingsViewController.swift
//  tips
//
//  Created by Daniel Trostli on 3/1/15.
//  Copyright (c) 2015 Trostli. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var colorThemeControl: UISegmentedControl!
    @IBOutlet weak var tipSettingLabel: UILabel!
    @IBOutlet weak var colorThemeLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipLevel = defaults.integerForKey("defaultTipLevel")
        var selectedColorTheme = defaults.integerForKey("selectedColorTheme")
        tipControl.selectedSegmentIndex = defaultTipLevel
        colorThemeControl.selectedSegmentIndex = selectedColorTheme
        
        setColorTheme()
    }
    
    @IBAction func onColorThemeControlChange(sender: AnyObject) {
        setColorTheme()
    }
    
    func setColorTheme(){
        if colorThemeControl.selectedSegmentIndex == 0 {
            UIView.animateWithDuration(0.3, animations: {
                self.tipSettingLabel.textColor = UIColor.blackColor()
                self.colorThemeLabel.textColor = UIColor.blackColor()
                self.view.backgroundColor = UIColor.whiteColor()
                self.colorThemeControl.tintColor = self.view.tintColor
                self.tipControl.tintColor = self.view.tintColor
                self.saveButton.tintColor = self.view.tintColor
            })
            
        } else {
            UIView.animateWithDuration(0.3, animations: {
                self.tipSettingLabel.textColor = UIColor.whiteColor()
                self.colorThemeLabel.textColor = UIColor.whiteColor()
                self.view.backgroundColor = UIColor.darkGrayColor()
                self.colorThemeControl.tintColor = UIColor.whiteColor()
                self.tipControl.tintColor = UIColor.whiteColor()
                self.saveButton.tintColor = UIColor.whiteColor()
            })
        }
    }
    
    @IBAction func hitSaveButton(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "defaultTipLevel")
        defaults.setInteger(colorThemeControl.selectedSegmentIndex, forKey: "selectedColorTheme")
        defaults.synchronize()
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
