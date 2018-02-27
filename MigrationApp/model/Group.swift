//
//  Group.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/27/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Group{
    var id: Int = -1
    var name: String?
    
    init?(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
    }
}
struct Groups {
    var array: Array = Array<Group>()
    
    init(json:JSON) {
        let jsonArr:[JSON] = json.arrayValue
        for json in jsonArr {
            array.append(Group(json:json)!)
        }
    }
}
