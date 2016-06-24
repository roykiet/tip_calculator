//
//  ViewController.swift
//  tips
//
//  Created by Chau Anh Kiet on 6/22/16.
//  Copyright (c) 2016 kietchau. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var amountTipLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var amountTotalLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var middleBarView: UIView!

    let defaults = NSUserDefaults.standardUserDefaults()
    let defaultTipPercentages = Constants.defaultTipPercentages
    let formatter = NSNumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        amountTipLabel.text = "$0.00"
        amountTotalLabel.text = "$0.00"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.
        
        //Animation
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.tipPercentControl.center.y += self.view.bounds.height
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: .CurveEaseOut, animations: {
            self.billField.center.y += self.view.bounds.height
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: .CurveEaseOut, animations: {
            self.amountTotalLabel.center.y += self.view.bounds.height
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.4, options: .CurveEaseOut, animations: {
            self.amountTipLabel.center.y += self.view.bounds.height
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.billLabel.center.y += self.view.bounds.height
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: .CurveEaseOut, animations: {
            self.tipLabel.center.y += self.view.bounds.height
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: .CurveEaseOut, animations: {
            self.totalLabel.center.y += self.view.bounds.height
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.4, options: .CurveEaseOut, animations: {
            self.middleBarView.center.y += self.view.bounds.height
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        amountTotalLabel.adjustsFontSizeToFitWidth = true
        amountTotalLabel.minimumScaleFactor =  0.5
        
        // load tipPercetages
        var tipPercentages = defaultTipPercentages
        if defaults.objectForKey("tipPercentages") != nil {
            let settingsTipPercentages : [String] = (defaults.objectForKey("tipPercentages") as? [String]!)!
            tipPercentages = [Int(settingsTipPercentages[0])!, Int(settingsTipPercentages[1])!, Int(settingsTipPercentages[2])!]
        }
        tipPercentControl.setTitle("\(tipPercentages[0])%", forSegmentAtIndex: 0)
        tipPercentControl.setTitle("\(tipPercentages[1])%", forSegmentAtIndex: 1)
        tipPercentControl.setTitle("\(tipPercentages[2])%", forSegmentAtIndex: 2)
        calculateTotalBill()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tipPercentControl.center.y -= view.bounds.height
        billField.center.y -= view.bounds.height
        amountTipLabel.center.y -= view.bounds.height
        amountTotalLabel.center.y -= view.bounds.height
        billLabel.center.y -= view.bounds.height
        tipLabel.center.y -= view.bounds.height
        totalLabel.center.y -= view.bounds.height
        middleBarView.center.y -= view.bounds.height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onEditingChanged(sender: AnyObject){
        calculateTotalBill()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func unwindToSettingsViewController (sender: UIStoryboardSegue){
        
    }
    
    private func calculateTotalBill(){
        var tipPercentages = defaultTipPercentages
        if defaults.objectForKey("tipPercentages") != nil {
            let settingsTipPercentages : [String] = (defaults.objectForKey("tipPercentages") as? [String]!)!
            tipPercentages = [Int(settingsTipPercentages[0])!, Int(settingsTipPercentages[1])!, Int(settingsTipPercentages[2])!]
        }
        let tipPercent = tipPercentages[tipPercentControl.selectedSegmentIndex]
        let billAmount = self.stringToDouble(self.billField.text!)
        let tip : Double = billAmount * Double(tipPercent) / 100
        let total = billAmount + tip
        
        amountTipLabel.text = formatCurrency(tip)
        amountTotalLabel.text = formatCurrency(total)
        billField.text = formatThousandNumber(billAmount)
    }
    
    private func stringToDouble(string:String) -> Double{
        let s = string.stringByReplacingOccurrencesOfString(",", withString: "")
        formatter.groupingSeparator = " "
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        let result = formatter.numberFromString(s)
        
        if (result?.doubleValue == nil) {
            return 0
        } else {
            return (result?.doubleValue)!
        }
    }
    
    private func formatThousandNumber(inputNumber: Double) -> String?{
        formatter.groupingSeparator = ","
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        let result = formatter.stringFromNumber(inputNumber)
        return result
    }
    
    private func formatCurrency(inputNumber: Double) -> String?{
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        formatter.maximumFractionDigits = 2
        let result = formatter.stringFromNumber(inputNumber)
        return result
    }

}

