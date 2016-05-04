//
//  ItemModel.swift
//  HoltWinters
//
//  Created by Bruno Tortato Furtado on 03/05/16.
//  Copyright © 2016 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

final class ItemModel: CustomStringConvertible {
    
    var t: Int = 0
    var d: Double = 0
    var L: Double = 0
    var b: Double = 0
    var S: Double = 0
    var F: Double = 0
    var e: Double = 0
    var ep: Double = 0
    
    // MARK: CustomStringConvertible
    
    var description: String {
        var line = "\(self.t);"
        
        line += (self.d == 0.0) ? ";" : "\(d.toString(2));"
        line += (self.L == 0.0) ? ";" : "\(L.toString(4));"
        line += (self.b == 0.0) ? ";" : "\(b.toString(6));"
        line += (self.S == 0.0) ? ";" : "\(S.toString(6));"
        line += (self.F == 0.0) ? ";" : "\(F.toString(4));"
        line += (self.e == 0.0) ? ";" : "\(e.toString(3));"
        line += (self.ep == 0.0) ? ";" : "\(ep.toString(1))%;"
        
        return line
    }
    
}