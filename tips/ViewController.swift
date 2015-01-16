//
//  ViewController.swift
//  tips
//
//  Created by Julia Khusainova on 1/14/15.
//  Copyright (c) 2015 Julia Khusainova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var peopleControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "0.00"
        
        [billField .becomeFirstResponder()]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var numberOfPeople = [1.0, 2.0, 3.0, 4.0]
        var sNumberOfPeople = numberOfPeople[peopleControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = (billAmount + tip) / sNumberOfPeople
        
        println(sNumberOfPeople);
//        var total2 = sNumberOfPeople
        
//        tipLabel.text = "$\(tip)"
//        totalLabel.text = "$\(total2)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
        
    }

    @IBAction func editingBegin(sender: AnyObject) {
        billField.text = "";
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

