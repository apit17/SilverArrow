//
//  ErrorHandler.swift
//  SilverArrow
//
//  Created by Apit on 2/20/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import Foundation
import Moya

class ErrorHandler: NSObject {
    private(set) var code: String!
    private(set) var desc: String!
    var errorData: Response!
    
    init(error: NSError) {
        super.init()
        setSelf(code: "\(error.code)", desc: error.localizedDescription)
    }
    
    init(code: String, desc: String) {
        super.init()
        setSelf(code: code, desc: desc)
    }
    
    private func setSelf(code: String, desc: String) {
        var description = desc
        if code == "500" {
            description = "Server Error"
        }
        self.code = code
        self.desc = description
    }
}
