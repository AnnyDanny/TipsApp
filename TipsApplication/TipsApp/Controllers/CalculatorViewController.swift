//
//  ViewController.swift
//  TipsApp
//
//  Created by Anna Danilova on 05.03.2021.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfpeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPerscentSigh = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPerscentSigh)!
        tip = buttonTitleAsNumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        let number = Int(sender.value).description
        if number != "" {
            numberOfpeople = Int(number)!
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfpeople)
            finalResult = String(format: "%.2f", result)
            print(finalResult)
        }
        self.performSegue(withIdentifier: " goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == " goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfpeople
        }
    }
    
    
}

