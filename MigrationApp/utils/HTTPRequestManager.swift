//
//  HTTPRequestManager.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/27/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SystemConfiguration

class HTTPRequestManager {
    
    typealias SuccessHandler = (JSON) -> Void
    typealias FailureHandler = (String)-> Void
    typealias Parameter = [String: Any]?
    
    let url = "http://188.166.247.80/api/v1/"
    
    private func request(method: HTTPMethod, api: String, parameters: Parameter, completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        
        if !isConnectedToNetwork() {
            error("Нет подключения к интернету")
            return
        }
        
        let APIaddress = "\(url)\(api)"
        
        Alamofire.request(APIaddress, method: method, parameters: parameters, encoding: JSONEncoding.default , headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            guard response.response != nil else {
                error("Не удалось загрузить данные.")
                return
            }
            
            guard let statusCode = response.response?.statusCode else {
                if response.result.isFailure {
                    if (response.error != nil) {
                        if let description = response.error?.localizedDescription  {
                            error(description)
                        }
                        
                    } else {
                        error("Не удалось загрузить данные. Вероятно, соединение с Интернетом прервано.")
                    }
                    return
                }
                error("Не удалось получить код статуса")
                return
            }
            
            
            
            print("\(statusCode) - \(api)")
            do {
            switch(statusCode) {
                case HttpStatusCode.ok.statusCode,
                     HttpStatusCode.accepted.statusCode,
                     HttpStatusCode.created.statusCode:
                    try completion(JSON(data: response.data!))
                    break
                default:
                    let json = try JSON(data: response.data!)
                    if !json.isEmpty {
                        print(json)
                        let message = json.stringValue
                        error(message)
                    } else {
                        if let data = response.data {
                            let json = String(data: data, encoding: String.Encoding.utf8)
                            error(json!)
                        } else {
                            error("")
                        }
                    }
                }
                 } catch {
                    print(error)
                }
        }
    }
    
    
    
    internal func post(api: String, parameters: [String: Any], completion: @escaping (JSON)-> Void, error: @escaping (String)-> Void) {
        request(method: .post, api: api, parameters: parameters, completion: completion, error: error)
    }
    internal func delete(api: String, parameters: [String: Any], completion: @escaping (JSON)-> Void, error: @escaping (String)-> Void) {
        request(method: .delete, api: api, parameters: parameters, completion: completion, error: error)
    }
    internal func put(api: String, parameters: [String: Any], completion: @escaping (JSON)-> Void, error: @escaping (String)-> Void) {
        request(method: .put, api: api, parameters: parameters, completion: completion, error: error)
    }
    internal func get(api: String, completion: @escaping (JSON)-> Void, error: @escaping (String)-> Void) {
        request(method: .get, api: api, parameters: nil, completion: completion, error: error)
    }
    
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
}
