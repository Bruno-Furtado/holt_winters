//
//  TableForecastingModel.swift
//  HoltWinters
//
//  Created by Bruno Tortato Furtado on 03/05/16.
//  Copyright © 2016 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

final class TableForecastingModel: CustomStringConvertible {
    
    let items: [ItemModel]
    
    // MARK: NSObject
    
    init(items: [ItemModel]) {
        self.items = items
    }
    
    // MARK: CustomStringConvertible
    
    var description: String {
        var forecasting = "t;Demand;L;b;S;F;e;e%"
        
        for item in self.items {
            forecasting += "\n\(item.description)"
        }
        
        return "\(forecasting)"
    }
    
}