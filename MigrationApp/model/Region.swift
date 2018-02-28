//
//  Region.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/28/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Region {
    var id : Int = -1
    var name_kg : String?
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name_kg = json["name_kg"].stringValue
    }
}

struct Regions {
    var array: Array = Array<Region>()
    
    init(json:JSON) {
        let jsonArr:[JSON] = json.arrayValue
        for json in jsonArr {
            array.append(Region(json:json))
        }
    }
}
