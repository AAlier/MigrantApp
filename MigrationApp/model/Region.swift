//
//  Region.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import Foundation
import SwiftyJSON

class Region {
    var id : Int
    var name : String
    
    init(json : JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
    }
}

class Regions {
    var array : Array = Array<Region>()
    
    init(json : JSON) {
        let jsonArray : [JSON] = json.arrayValue
        for json in jsonArray {
            let tempObj = Region(json : json)
            array.append(tempObj)
        }
    }
}
