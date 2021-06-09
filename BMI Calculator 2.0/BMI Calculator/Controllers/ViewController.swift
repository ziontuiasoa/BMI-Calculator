//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Zion Tuiasoa on 12/3/20.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var calculateButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        heightSlider.value = 1.5
        weightSlider.value = 100
    }

  
    @IBAction func heightSliderChanged(_ sender: UISlider) {
            let height = String(format: "%.2f", heightSlider.value)
            heightLabel.text = "\(height)m"
    }

    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f",(weightSlider.value))
        weightLabel.text = "\(weight)Kg"
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToResult" {
                let destinationVC = segue.destination as! ResultViewController
                destinationVC.bmiValue = calculatorBrain.getBMIValue()
                destinationVC.advice = calculatorBrain.getAdvice()
                destinationVC.color = calculatorBrain.getColor()
        }
    }
}
