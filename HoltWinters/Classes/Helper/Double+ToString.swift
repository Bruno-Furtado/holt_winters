//
//  Double+ToString.swift
//  HoltWinters
//
//  Created by Bruno Tortato Furtado on 03/05/16.
//  Copyright © 2016 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

extension Double {
    
    func toString(fractionDigits: Int) -> String {
        let formatter = NSNumberFormatter()
        
        formatter.numberStyle = .DecimalStyle
        formatter.minimumFractionDigits = fractionDigits
        formatter.maximumFractionDigits = fractionDigits
        
        return formatter.stringFromNumber(self)!
    }
    
}
