//
//  SilverArrowAPI.swift
//  SilverArrow
//
//  Created by Apit on 2/15/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper
import Moya_ObjectMapper

enum ServerAPI {
    case login(username: String, password: String)
    case forgotPassword
    case signUp
}

extension ServerAPI: TargetType {
    static let baseApi = "api/v1/mobile/"
    static let loginApi = ServerAPI.baseApi + "user/credential/login"
    var sampleData: Data {
        return Data()
    }
    
    var baseURL: URL {
        guard let url = URL(string: "http://kpm.stagingapps.net/") else { fatalError("Base URL could not be configure") }
        return url
    }
    
    //path for completed url
    var path: String {
        switch self {
        case .login:
            return ServerAPI.loginApi
        case .forgotPassword:
            return "forgot_password"
        case .signUp:
            return "signup"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .forgotPassword, .signUp:
            return .post
        }
    }
        
    var parameters: [String: Any]? {
        switch self {
        case .login(let username, let password):
            return ["email": username, "password": password, "device_id": "asdf-asd98asdj-kj"]
        case .forgotPassword:
            return [:]
        case .signUp:
            return [:]
        }
    }
        
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .login, .forgotPassword, .signUp:
            return URLEncoding.queryString
        }
    }
    
    var task: Task {
        switch self {
        case .login, .signUp, .forgotPassword:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .login, .signUp, .forgotPassword:
            return ["Content-Type": "application/json"]
        }
    }
    
    
}
