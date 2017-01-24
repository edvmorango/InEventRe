import Foundation
import Moya
import Alamofire

enum InEventAPI{
    case login(login : String, password: String )
}

struct InEventEncoding: ParameterEncoding{
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        
        let newUrl = urlRequest.urlRequest!.url!.absoluteString.replacingOccurrences(of: "/api/", with: "/api/?action=")
        let url = URL(string: newUrl)!
        let body = parameters?.map{$0.key + "=" + String(describing: $0.value)}.joined(separator: "&")
        
        var request = URLRequest(url: url)
        request.httpBody = body?.data(using: .utf8)
        request.httpMethod = urlRequest.urlRequest?.httpMethod
        
        
        return request
    }
}

extension InEventAPI: TargetType{
      
    var baseURL: URL { return
        URL(fileURLWithPath: "https://inevent.us/api/")
    }
    
    public var path: String {
        
        switch self {
        case .login(let values):
            return "person.signIn&username="+values.login
              }
    }
    
    var method: Moya.Method {
        switch self{
            
        case  .login: return .post
            
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        return InEventEncoding()
    }
    
    
    
    public var parameters: [String : Any]? {
        switch self{
            
        case .login(let value):  return ["password": value.password]
            
        }
    }
    
    
    public var task: Task {
        return .request
    }
    
    public var sampleData: Data {
        switch self{
        default : return Data()
        }
    }
    
    
    
    
    
    
    
}
