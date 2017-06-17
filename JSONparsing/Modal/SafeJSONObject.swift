//
//  SafeJSONObject.swift
//  JSONparsing
//
//  Created by Aditya Tanna on 6/17/17.
//  Copyright © 2017 Tanna Inc. All rights reserved.
//

import Foundation

class SafeJSONObject: NSObject {
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        let strSelector = "set\(key.uppercased().characters.first!)\(String(key.characters.dropFirst())):"
        let selector = Selector(strSelector)
        if responds(to: selector) {
            super.setValue(value, forKey: key)
        }
    }
}
