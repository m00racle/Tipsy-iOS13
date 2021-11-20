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
    var tipFactor:Double!
    var numberOfPeople : Double!
    var payPerPerson : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        set initial value
        billTextField.resignFirstResponder()
        tipFactor = zeroPctButton.isSelected ? 0.0 : tenPctButton.isSelected ? 0.1 : 0.2
        numberOfPeople = Double(splitNumberLabel.text ?? "")
    }

//    actions:
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
//        retract keyboard if billTextField is selected prior
        billTextField.endEditing(true)
//        handle stepper value changing
//        change the splitNubmerLabel
        splitNumberLabel.text = String(format:"%.0f", sender.value)
//        numberOfPeople = Float(sender.value)
//        NOTE: the number used in the calculation will be the one displayed on the split number label.
//        this is to varify that the user already see the number he/she inputted. Thus the code becomes:
        numberOfPeople = Double(splitNumberLabel.text ?? "")
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
//        retract keyboard if the billTextField is selected prior
        billTextField.endEditing(true)
//        handle each button changed and handles other tip buttons.
//        set all buttons to deselect first and then put the sender to isSelected = true
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
//        set the sender as isSelected
        sender.isSelected = true
        tipFactor = (Double(sender.currentTitle ?? "") ?? 0.0)/100
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTextField.endEditing(true)
//        handle calculation
        let billAmount = Double(billTextField.text ?? "")
        if billAmount == nil {
            payPerPerson = "Empty Bill"
        } else {
            let result = (billAmount! * (1 + tipFactor))/numberOfPeople
            payPerPerson = String(format:"%.2f", result)
        }
        
        performSegue(withIdentifier: "resultSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        prepare things to bring to the result viewer
        if segue.identifier == "resultSegue" {
//            put the calculation results
            let destinationView = segue.destination as! ResultViewController
            destinationView.tipFactor = tipFactor
            destinationView.numberOfPeople = numberOfPeople
            destinationView.payPerPerson = payPerPerson
        }
    }
    
}

