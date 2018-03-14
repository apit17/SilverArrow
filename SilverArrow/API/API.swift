//
//  API.swift
//  SilverArrow
//
//  Created by Apit on 2/19/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import Foundation
import Moya

class API {
    static let provider = MoyaProvider<ServerAPI>()
    
    static func request(target: ServerAPI, success successCallback: @escaping(Response) -> Void, error errorCallback: @escaping(ErrorHandler) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                do {
                    let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any]
                    print(json ?? [:])
                }catch {
                    print("ererererere")
                }
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    successCallback(response)
                }else {
                    let error = ErrorHandler(code: String(response.statusCode), desc: response.description)
                    errorCallback(error)
                }
            case .failure(let error):
                errorCallback(ErrorHandler(error: error as NSError))
            }
        }
    }
}
