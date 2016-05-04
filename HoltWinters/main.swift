//
//  main.swift
//  HoltWinters
//
//  Created by Bruno Tortato Furtado on 03/05/16.
//  Copyright © 2016 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

let dataFileName = "historical_data.txt"
let forecastingFileName = "forecasting.csv"
let errorsFileName = "errors.csv"

let s: Int = 3
let alpha: Float = 0.3
let beta: Float = 0.3
let gamma: Float = 0.3

print("Processing has been started.")
print("Waiting...")

let controller = Controller(dataFileName: dataFileName, s: s, alpha: alpha, beta: beta, gamma: gamma)
let result = controller.saveResultAtFiles(forecastingFileName, errorsFileName: errorsFileName)

if (result.forecastingSaved) {
    print("Forecasting has been saved successfully.")
} else {
    print("Forecasting has not been saved.")
}

if (result.errorsSaved) {
    print("Erros has been saved successfully.")
} else {
    print("Erros has not been saved.")
}

print("")