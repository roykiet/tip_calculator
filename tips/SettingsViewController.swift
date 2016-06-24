//
//  SettingsViewController.swift
//  tips
//
//  Created by Chau Anh Kiet on 6/22/16.
//  Copyright (c) 2016 kietchau. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentage1Field: UITextField!
    @IBOutlet weak var tipPercentage2Field: UITextField!
    @IBOutlet weak var tipPercentage3Field: UITextField!
    @IBOutlet weak var tipPercentage1Label: UILabel!
    @IBOutlet weak var tipPercentage2Label: UILabel!
    @IBOutlet weak var tipPercentage3Label: UILabel!
    @IBOutlet weak var symbol1Label: UILabel!
    @IBOutlet weak var symbol2Label: UILabel!
    @IBOutlet weak var symbol3Label: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    let defaultTipPercentages = Constants.defaultTipPercentages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Animation
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.tipPercentage1Field.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: .CurveEaseOut, animations: {
            self.tipPercentage2Field.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: .CurveEaseOut, animations: {
            self.tipPercentage3Field.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.4, options: .CurveEaseOut, animations: {
            self.tipPercentage1Label.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.tipPercentage2Label.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: .CurveEaseOut, animations: {
            self.tipPercentage3Label.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: .CurveEaseOut, animations: {
            self.symbol1Label.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.4, options: .CurveEaseOut, animations: {
            self.symbol2Label.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.4, options: .CurveEaseOut, animations: {
            self.symbol3Label.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.4, options: .CurveEaseOut, animations: {
            self.saveButton.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)

        // load settings
        let settingsTipPercentages = defaults.objectForKey("tipPercentages") as? [Int]
        
        var tipPercentages = defaultTipPercentages
        if settingsTipPercentages != nil {
            tipPercentages = settingsTipPercentages!
        }
        tipPercentage1Field.text = "\(tipPercentages[0])"
        tipPercentage2Field.text = "\(tipPercentages[1])"
        tipPercentage3Field.text = "\(tipPercentages[2])"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tipPercentage1Field.center.x -= view.bounds.width
        tipPercentage2Field.center.x -= view.bounds.width
        tipPercentage3Field.center.x -= view.bounds.width
        tipPercentage1Label.center.x -= view.bounds.width
        tipPercentage2Label.center.x -= view.bounds.width
        tipPercentage3Label.center.x -= view.bounds.width
        symbol1Label.center.x -= view.bounds.width
        symbol2Label.center.x -= view.bounds.width
        symbol3Label.center.x -= view.bounds.width
        saveButton.center.x -= view.bounds.width
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTouch(sender: AnyObject) {
        let tipPercentage1 = tipPercentage1Field.text!
        let tipPercentage2 = tipPercentage2Field.text!
        let tipPercentage3 = tipPercentage3Field.text!
        let tipPercentages = [tipPercentage1, tipPercentage2, tipPercentage3]
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(tipPercentages, forKey: "tipPercentages")
        defaults.synchronize()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
