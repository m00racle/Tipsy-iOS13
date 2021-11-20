//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Yanuar Heru on 22/10/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var tipFactor : Double!
    var numberOfPeople : Double!
    var payPerPerson : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = payPerPerson
        settingsLabel.text = "Split between \(Int(numberOfPeople ?? 0.0)) people, with \(Int(tipFactor*100))% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
//        handle the recalculate button pressed
//        back to the previous view
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
