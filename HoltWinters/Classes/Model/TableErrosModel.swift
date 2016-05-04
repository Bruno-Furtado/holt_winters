//
//  TableErrosModel.swift
//  HoltWinters
//
//  Created by Bruno Tortato Furtado on 03/05/16.
//  Copyright © 2016 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

final class TableErrorsModel: CustomStringConvertible {
    
    let mae: Double
    let mape: Double
    
    // MARK: NSObject
    
    init(mae: Double, mape: Double) {
        self.mae = mae
        self.mape = mape
    }
    
    // MARK: CustomStringConvertible
    
    var description: String {
        let header = ";VALUE"
        
        let mae = "MAE;\(self.mae.toString(3))"
        let mape = "MAPE;\(self.mape.toString(1))%"
        
        return "\(header)\n\(mae)\n\(mape)"
    }
    
}