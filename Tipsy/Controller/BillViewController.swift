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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    actions:
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
//        handle stepper value changing
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
//        handle each button changed and handles other tip buttons.
//        set all buttons to deselect first and then put the sender to isSelected = true
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
//        set the sender as isSelected
        sender.isSelected = true
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
//        handle calculation
    }
    
    
}

