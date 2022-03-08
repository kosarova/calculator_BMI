//
//  calculatorBrain.swift
//  BMI Calculator
//
//  Created by Roman Kobzarev on 08.03.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBrain {
    var bmi : BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        var bmiValue = weight / (height * height)
        switch bmiValue {
        case ..<18.5:
            bmi = BMI(value: bmiValue, advice: "Eat more pies :)", color: UIColor(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        case 18.5...24.9:
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        case 24.9...:
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        default:
            bmiValue = 0.0
        }
    }
    func getBMI() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "Wrong parameters"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
}
                      
