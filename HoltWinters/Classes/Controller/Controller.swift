//
//  Controller.swift
//  HoltWinters
//
//  Created by Bruno Tortato Furtado on 03/05/16.
//  Copyright © 2016 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

class Controller {
    
    private var items: [ItemModel]?
    private var s = 0
    
    // MARK: Publics
    
    init(dataFileName: String, s: Int, alpha: Float, beta: Float, gamma: Float) {
        self.s = s
        
        // getting file values
        
        let itemsWithData = Service.loadDataFromFile(dataFileName)
        
        if (itemsWithData == nil || itemsWithData?.count == 0) {
            print("[WARNING] \(#file):\(#function):\(#line) - null or empty items with data")
            return
        }
        
        // initial setup
        
        let itemsWithSetup = Service.initialSetup(itemsWithData!, s: s)
        
        if (itemsWithSetup == nil) {
            print("[WARNING] \(#file):\(#function):\(#line) - null items with initial setup")
            return
        }
 
        // learning
        
        let itemsWithLearning = Service.learning(itemsWithSetup!, s: s, alpha: alpha, beta: beta, gamma: gamma)
        
        if (itemsWithLearning == nil) {
            print("[WARNING] \(#file):\(#function):\(#line) - null items with learning")
            return
        }
        
        // prediction
        
        let itemsWithPrediction = Service.prediction(itemsWithLearning!, s: s)
        
        if (itemsWithPrediction == nil) {
            print("[WARNING] \(#file):\(#function):\(#line) - null items with prediction")
            return
        }
        
        self.items = itemsWithPrediction
    }
    
    func saveResultAtFiles(forecastingFileName: String, errorsFileName: String, forecastingCompletion: (saved: Bool) -> Void, errorsCompletion: (saved: Bool) -> Void) {
        if (self.items == nil) {
            print("[WARNING] \(#file):\(#function):\(#line) - null items")
            forecastingCompletion(saved: false)
            errorsCompletion(saved: false)
        }
        
        let erros = Service.errors(self.items!, s: self.s)
        let tableErros = TableErrorsModel(mae: erros.mae, mape: erros.mape)
        let tableForecasting = TableForecastingModel(items: self.items!)
        
        Service.saveContentAtFile(tableForecasting.description, fileName: forecastingFileName, completion: forecastingCompletion)
        Service.saveContentAtFile(tableErros.description, fileName: errorsFileName, completion: errorsCompletion)
    }
    
}