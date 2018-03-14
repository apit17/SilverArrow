//
//  Login.swift
//  SilverArrow
//
//  Created by Apit on 2/20/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import Foundation
import Mapper
import Moya_ModelMapper
import Moya_ObjectMapper

class Login: Mappable {
    
    var userId: Int?
    
    required init(map: Mapper) throws {
        try userId = map.from("UID")
    }
}
