//
//  citizen.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/27/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Citizen {
    var id : Int = -1
    var name_ru : String?
    var name_kg : String?
    var name_uz : String?
    var name_en : String?
    var name_tj : String?
    var group : Int = -1
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name_ru = json["name_ru"].stringValue
        self.name_kg = json["name_kg"].stringValue
        self.name_uz = json["name_uz"].stringValue
        self.name_en = json["name_en"].stringValue
        self.name_tj = json["name_tj"].stringValue
        self.group = json["group"].intValue
    }
    
}


struct Citizens {
    var array: Array = Array<Citizen>()
    
    init(json:JSON) {
        let jsonArr:[JSON] = json.arrayValue
        for json in jsonArr {
            array.append(Citizen(json:json))
        }
    }
}
