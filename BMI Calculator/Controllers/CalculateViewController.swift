//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculateBrain = CalculateBrain()

    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    
    @IBOutlet weak var heightSliderLabel: UISlider!
    @IBOutlet weak var weightSliderLabel: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    @IBAction func heightSlider(_ sender: UISlider) {
        heightValue.text = "\((String(format: "%.2f", sender.value)))m"
    }
    @IBAction func weightSlider(_ sender: UISlider) {
        weightValue.text = "\(Int(sender.value))kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSliderLabel.value
        let weight = weightSliderLabel.value
        
        calculateBrain.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculateBrain.getBMI()
            destinationVC.advice = calculateBrain.getAdvice()
            destinationVC.color = calculateBrain.getColor()
        }
    }

}

