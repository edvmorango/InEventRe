//
//  AppReducer.swift
//  InEventRe
//
//  Created by José Eduardo Vieira Morango on 16/01/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import ReSwift

struct AppReducer: Reducer{
    typealias ReducerStateType = AppState
    
    public func handleAction(action: Action, state: AppState?) -> AppState {
        
        return AppState(user: AppStateReducer(action: action, user: state?.user))
        
    }

}


func AppStateReducer(action: Action, user : User?) -> User?{
    
    var newUser: User?
    
    switch action{
    
    case let action as ActionLogin:  newUser = action.user
        
    default: break
    
    }
    
    return newUser

}
