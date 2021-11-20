//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class BillViewController: UIViewController {
//    outlets:
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepperButtons: UIStepper!
    var tipFactor:Float!
    var numberOfPeople : Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        set initial value
        billTextField.resignFirstResponder()
        tipFactor = zeroPctButton.isSelected ? 0.0 : tenPctButton.isSelected ? 0.1 : 0.2
        numberOfPeople = (splitNumberLabel.text! as NSString).floatValue
    }

//    actions:
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
//        retract keyboard if billTextField is selected prior
        billTextField.resignFirstResponder()
//        handle stepper value changing
//        change the splitNubmerLabel
        splitNumberLabel.text = String(format:"%.0f", sender.value)
//        numberOfPeople = Float(sender.value)
//        NOTE: the number used in the calculation will be the one displayed on the split number label.
//        this is to varify that the user already see the number he/she inputted. Thus the code becomes:
        numberOfPeople = (splitNumberLabel.text! as NSString).floatValue
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
//        retract keyboard if the billTextField is selected prior
        billTextField.resignFirstResponder()
//        handle each button changed and handles other tip buttons.
//        set all buttons to deselect first and then put the sender to isSelected = true
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
//        set the sender as isSelected
        sender.isSelected = true
        tipFactor = (sender.currentTitle! as NSString).floatValue/100
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTextField.resignFirstResponder()
//        handle calculation
        performSegue(withIdentifier: "resultSegue", sender: self)
    }
    
    
}

