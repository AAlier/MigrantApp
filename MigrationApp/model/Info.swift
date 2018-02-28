//
//  Info.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/28/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Info {
    var id : Int = -1
    var content_ru : String?
    var content_kg : String?
    var content_uz : String?
    var content_en : String?
    var content_tj : String?
    var group : Int = -1
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.content_ru = json["content_ru"].stringValue
        self.content_kg = json["content_kg"].stringValue
        self.content_uz = json["content_uz"].stringValue
        self.content_en = json["content_en"].stringValue
        self.content_tj = json["content_tj"].stringValue
        self.group = json["group"].intValue
    }
}
struct Infos {
    var array: Array = Array<Info>()
    
    init(json:JSON) {
        let jsonArr:[JSON] = json.arrayValue
        for json in jsonArr {
            array.append(Info(json:json))
        }
    }
}
