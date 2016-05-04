//
//  String+ToDouble.swift
//  HoltWinters
//
//  Created by Bruno Tortato Furtado on 04/05/16.
//  Copyright © 2016 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

extension String {

    func toNumber() -> NSNumber {
        let formatter = NSNumberFormatter()
        
        formatter.numberStyle = .DecimalStyle
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        
        if let result = formatter.numberFromString(self) {
            return result
        }
        
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
        
        if let result = formatter.numberFromString(self) {
            return result
        }
        
        print("[WARNING] \(#file):\(#function):\(#line) - convert string to number with failure")
        return 0
    }
    
}