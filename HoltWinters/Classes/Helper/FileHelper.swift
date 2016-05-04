//
//  FileHelper.swift
//  HoltWinters
//
//  Created by Bruno Tortato Furtado on 03/05/16.
//  Copyright © 2016 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

class FileHelper {
    
    // MARK: Publics
    
    static func loadDataOfFileWithName(fileName: String) -> String? {
        if let desktopPath = NSSearchPathForDirectoriesInDomains(.DesktopDirectory, .AllDomainsMask, true).first {
            let dataPath = NSURL(fileURLWithPath: desktopPath).URLByAppendingPathComponent(fileName)
            
            do {
                return try String(contentsOfURL: dataPath, encoding: NSUTF8StringEncoding)
            } catch let error as NSError {
                print("[ERROR] \(#file):\(#function):\(#line) - \(error.localizedDescription)")
                return nil
            }
        }
        
        print("[WARNING] \(#file):\(#function):\(#line) - nil")
        return  nil
    }
    
    static func saveContentAtFile(content: String, fileName: String) -> Bool {
        if let desktopPath = NSSearchPathForDirectoriesInDomains(.DesktopDirectory, .AllDomainsMask, true).first {
            let resultPath = NSURL(fileURLWithPath: desktopPath).URLByAppendingPathComponent(fileName)
            
            do {
                try content.writeToURL(resultPath, atomically: true, encoding: NSUTF8StringEncoding)
                return true
            } catch let error as NSError {
                print("[ERROR] \(#file):\(#function):\(#line) - \(error.localizedDescription)")
                return false
            }
        }
        
        print("[WARNING] \(#file):\(#function):\(#line) - nil")
        return false
    }
    
}