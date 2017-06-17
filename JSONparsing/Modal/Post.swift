//
//  Post.swift
//  JSONparsing
//
//  Created by Aditya Tanna on 6/17/17.
//  Copyright © 2017 Tanna Inc. All rights reserved.
//

import Foundation

class Post: SafeJSONObject {
    
    var post:String?
    var name:String?
    var location:Location?
    var profileImageName:String?
    var statusText:String?
    var statusImageName:String?
    var numLikes:NSNumber?
    var numComments:NSNumber?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "location"{
            location = Location()
            
            location?.setValuesForKeys(value as! [String:Any])
            
        }else{
            super.setValue(value, forKey: key)
        }
    }
    
}
