//
//  InEventProvider.swift
//  InEventRx
//
//  Created by José Eduardo Vieira Morango on 12/01/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import Moya
import Alamofire


extension Response{
    
    func removeAPIWrappers() -> Response{
        
        guard let json = try? self.mapJSON() as?  Dictionary<String, AnyObject>,
            let results = json?["data"],
            let newData = try? JSONSerialization.data(withJSONObject: results, options: .prettyPrinted) else{
                return self
        }
        
        return Response(statusCode: self.statusCode, data: newData, response: self.response)
    }
}

struct InEventAPIManager{
    
    let provider: MoyaProvider<InEventAPI>
    
    init() {
        provider = MoyaProvider<InEventAPI>()
    }
    

}

extension InEventAPIManager{
    
    public func login(login: String, password: String, completion : @escaping (User?) -> () ) {
    
        provider.request(.login(login: login, password: password)){
            
            if $0.error != nil {
                print($0.error!)
                return
            }
            
    
            let response = $0.value
            guard let result = try? response!.removeAPIWrappers().mapJSON() as! [[String : AnyObject]] else{
                print("Não há valores")
                return
            }
            
            completion(User.init(data: result.first!))
            
            
            
        }
    
        
    }
    

    
    
}


