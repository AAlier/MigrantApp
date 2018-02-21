//
//  Citizen.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import Foundation

import Foundation
import SwiftyJSON

class Citizen {
    var id : Int
    var name: String
    var group : String
    var groupId : String
    
    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        group = json["group"].stringValue
        groupId = json["groupId"].stringValue
    }
}

class Citizens {
    var array : Array = Array<Citizen>()
    
    init(json : JSON) {
        let jsonArray : [JSON] = json.arrayValue
        for json in jsonArray {
            let tempObj = Citizen(json : json)
            array.append(tempObj)
        }
    }
}
