//
//  User.swift
//  InEventRe
//
//  Created by José Eduardo Vieira Morango on 16/01/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation


struct User{
    let tokenId: String?
    let name : String
    let login : String
    let password : String?
    
    
    init(data: [String: AnyObject]) {
    
        tokenId = data["tokenID"] as! String?
        name  = data["name"] as! String
        login = data["email"] as! String
        password = nil
        
        
    }
    
    
}
