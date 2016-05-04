//
//  Service.swift
//  HoltWinters
//
//  Created by Bruno Tortato Furtado on 03/05/16.
//  Copyright © 2016 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

class Service {
    
    // MARK: File
    
    static func loadDataFromFile(fileName: String) -> [ItemModel]? {
        
        // getting file values
        
        var valuesString = FileHelper.loadDataOfFileWithName(fileName)
        if (valuesString == nil) {
            return nil
        }
        
        // changing '\r' for '' to convert String to Float
        
        valuesString = valuesString!.stringByReplacingOccurrencesOfString("\r", withString: "")
        
        // split the string values in an array
        
        let stringsArray = valuesString!.componentsSeparatedByString("\n")
        var numbersArray: [NSNumber] = []
        
        for string in stringsArray {
            let number = string.toNumber()
            numbersArray.append(number)
        }
        
        // creating an array of items
        
        var itemsArray: [ItemModel] = []
        
        for (index, element) in numbersArray.enumerate() {
            let item = ItemModel()
            item.t = index + 1
            item.d = element.doubleValue
            
            itemsArray.append(item)
        }
        
        return itemsArray
    }
    
    static func saveContentAtFile(content: String, fileName: String) -> Bool {
        return FileHelper.saveContentAtFile(content, fileName: fileName)
    }
    
    // MARK: Formulas
    
    static func initialSetup(items: [ItemModel], s: Int) -> [ItemModel]? {
        if (s >= items.count) {
            print("[WARNING] \(#file):\(#function):\(#line) - period >= array.count")
            return nil
        }
        
        // getting sum
        
        var sum: Double = 0
        let period = Double(s)
        
        for i in 0..<s {
            let item = items[i]
            sum += item.d
        }
        
        // setting the level
        
        let level = Double(sum / period)
        
        let item = items[s-1]
        item.L = level
        
        // setting the sasonal coefficient and the trend
        
        var b: Double = 0
        
        for i in 0..<s {
            let item = items[i]
            
            item.S = Double(item.d / level)
            b += Double((items[i+s].d - items[i].d) / period)
        }
        
        item.b = Double(b / period)
        
        return items
    }
    
    static func learning(items: [ItemModel], s: Int, alpha: Float, beta: Float, gamma: Float) -> [ItemModel]? {
        let newAlpha = Double(alpha)
        let newBeta = Double(beta)
        let newGamma = Double(gamma)
        
        for i in s..<items.count {
            let item = items[i]
            let previusItem = items[i-1]
            let periodItem = items[i-s]
            
            item.L = newAlpha * (item.d / periodItem.S) + (1 - newAlpha) * (previusItem.L + previusItem.b)
            item.b = newBeta * (item.L - previusItem.L) + (1 - newBeta) * previusItem.b
            item.S = newGamma * (item.d / item.L) + (1 - newGamma) * previusItem.S
            item.F = (item.L + 1 * item.b) * periodItem.S
            item.e = abs(item.d - item.F)
            item.ep = (item.e / item.d) * 100
        }
        
        return items
    }
    
    static func prediction(items: [ItemModel], s: Int) -> [ItemModel]? {
        let lastItem = items.last
        
        if (lastItem == nil) {
            print("[WARNING] \(#file):\(#function):\(#line) - last item null")
            return nil
        }
        
        var newArray = items
        let index = newArray.count-1
        
        let L = lastItem!.L
        let b = lastItem!.b
        
        var m: Double = 1
        
        for i in (0..<s).reverse() {
            let item = ItemModel()
            
            item.t = newArray.count+1
            item.F = (L + m * b) * newArray[index-i].S
            
            newArray.append(item)
            m += 1
        }
        
        return newArray
    }
    
    static func errors(items: [ItemModel], s: Int) -> (mae: Double, mape: Double) {
        var mae: Double = 0
        var mape: Double = 0
        
        for i in s..<items.count-s {
            mae += items[i].e
            mape += items[i].ep
        }
        
        mae /= Double(items.count - (2*s))
        mape /= Double(items.count - (2*s))
        
        return (mae, mape)
    }
    
}