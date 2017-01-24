//
//  ViewController.swift
//  InEventRe
//
//  Created by José Eduardo Vieira Morango on 15/01/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit
import ReSwift
class ViewController: UIViewController, StoreSubscriber  {
    
        public func newState(state: AppState) {

        guard let user = state.user else{
            lbLogin.text = "Deslogado"
            lbToken.text = "Token"
            return
        }
       
        lbLogin.text = "Logado"
        lbToken.text = user.tokenId!
        
        
    
    }

    override func viewDidLoad() {
       
        mainStore.subscribe(self)
        mainStore.subscribe(self, selector: {state in state})
        
        
    }
    
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfLogin: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lbLogin: UILabel!
    @IBOutlet weak var lbToken: UILabel!

    let apiManager = InEventAPIManager()
    
    
    @IBAction func btAction(_ sender: Any) {
    
    
        apiManager.login(login: tfLogin.text!, password: tfPassword.text!, completion: { user in mainStore.dispatch(ActionLogin(user: user))    })
    
    
    }

}

