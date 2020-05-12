//
//  API.swift
//  iBank
//
//  Created by Henrique on 11/05/20.
//  Copyright © 2020 Henrique. All rights reserved.
//

import Foundation
import Alamofire

///This is the enum that we're gonna use to not repeat code in our requests.
enum API: URLRequestConvertible {
    case login(username: String, password: String)
    case statement(page: Int)
    
    private var path: String {
        let Strings = Constants.Service.self
        
        switch self {
        case .login(_, _):
            return Strings.login
        case .statement(let page):
            return Strings.signup + "\(page)"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .login(_, _): return .post
        case .statement(_): return .get
        }
    }
    
    var parameters: Parameters? {
        let Fields = Constants.Fields.self
        switch self {
        case .login(let username, let password):
            return [Fields.username: username, Fields.password: password]
        default:
            return nil
            
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let base = Constants.Service.baseURL
        
        let url = try base.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
    
}
