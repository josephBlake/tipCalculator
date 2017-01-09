//
//  ViewController.swift
//  tipCalculator
//
//  Created by ablake on 10/3/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalBillAmountLabel: UILabel!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var fifteenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var twentyFiveButton: UIButton!
    @IBOutlet weak var numberOfPeople: UILabel!
    @IBOutlet weak var payPerPerson: UILabel!
    @IBOutlet weak var upArrow: UIButton!
    @IBOutlet weak var downArrow: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func tenButtonTapped(_ sender: AnyObject)
    {
        calculateTip(0.1)
        tenButton.setImage(UIImage(named: "10Selected"), for: UIControlState())
    }
    
    @IBAction func calculateButtonTapped(_ sender: AnyObject)
    {
        calculateTip(0.15)
        fifteenButton.setImage(UIImage(named: "15Selected"), for: UIControlState())
    }
    
    @IBAction func twentyButtonTapped(_ sender: AnyObject)
    {
        calculateTip(0.2)
        twentyButton.setImage(UIImage(named: "20Selected"), for: UIControlState())
        
    }
    
    @IBAction func twentyFiveButtonTapped(_ sender: AnyObject)
    {
        calculateTip(0.25)
        twentyFiveButton.setImage(UIImage(named: "25Selected"), for: UIControlState())
    }
    
    func calculateTip(_ tipPercent: Double)
    {
        let billFloatAmount = Double(billTextField.text!)
        let myTip = billFloatAmount! * tipPercent
        tipAmount.text = String(format: "$%.2f", myTip)
        let myBillTotal = billFloatAmount! + myTip
        totalBillAmountLabel.text = String(format: "$%.2f", myBillTotal)
        let payUp = myBillTotal / Double(numberOfPeople.text!)!
        payPerPerson.text = String(format: "$%.2f", payUp)
        billTextField.resignFirstResponder()
        clearImages()
    }
    
    func clearImages()
    {
        tenButton.setImage(UIImage(named: "10Unselected"), for: UIControlState())
        fifteenButton.setImage(UIImage(named: "15Unselected"), for: UIControlState())
        twentyButton.setImage(UIImage(named: "20Unselected"), for: UIControlState())
        twentyFiveButton.setImage(UIImage(named: "25Unselected"), for: UIControlState())
    }
    
    var num = 1
    @IBAction func upArrowTapped(_ sender: AnyObject)
    {
        num = num + 1
        numberOfPeople.text = String(num)
    }
    
    @IBAction func downArrowTapped(_ sender: AnyObject)
    {
        if(num > 1)
        {
            num = num - 1
            numberOfPeople.text = String(num)
        }
    }
    
}

