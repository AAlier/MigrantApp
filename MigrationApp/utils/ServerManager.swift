//
//  ServerManager.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/27/18.
//  Copyright © 2018 iCoder. All rights reserved.
//


import Foundation
import Alamofire

class ServerManager : HTTPRequestManager {
    
    class var shared: ServerManager {
        struct Static {
            static let instance = ServerManager()
        }
        return Static.instance
    }
    
    func getData(_ completion: @escaping (Data)-> Void, error: @escaping (String)-> Void) {
        
        self.get(api: "data", completion: { (json) in
            let obj = Data(json: json)
            print(obj)
            completion(obj)}, error: error)
    }
}


extension String: ParameterEncoding {
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
}
