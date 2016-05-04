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
    
    static func saveContentAtFile(content: String, fileName: String, completion: (saved: Bool) -> Void) {
        if let desktopPath = NSSearchPathForDirectoriesInDomains(.DesktopDirectory, .AllDomainsMask, true).first {
            let resultPath = NSURL(fileURLWithPath: desktopPath).URLByAppendingPathComponent(fileName)
            
            do {
                try content.writeToURL(resultPath, atomically: true, encoding: NSUTF8StringEncoding)
                completion(saved: true)
                return
            } catch let error as NSError {
                print("[ERROR] \(#file):\(#function):\(#line) - \(error.localizedDescription)")
                completion(saved: false)
                return
            }
        }
        
        print("[WARNING] \(#file):\(#function):\(#line) - nil")
        completion(saved: false)
    }
    
}