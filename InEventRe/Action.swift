//
//  Action.swift
//  InEventRe
//
//  Created by José Eduardo Vieira Morango on 16/01/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import ReSwift


struct ActionLogin: Action{
    let user : User?
    
    init(user: User? = nil) {
        self.user = user
    }
    
}
struct ActionSetToken: Action{}
