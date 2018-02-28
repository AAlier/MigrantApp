//
//  Accident.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/28/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Accident {
    var id : Int = -1
    var additional_infos : Infos?
    var title_ru : String?
    var title_kg : String?
    var title_uz : String?
    var title_en : String?
    var title_tj : String?
    var content_ru : String?
    var content_kg : String?
    var content_uz : String?
    var content_en : String?
    var content_tj : String?
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.additional_infos = Infos(json: json["additional_infos"])
        self.title_ru = json["title_ru"].stringValue
        self.title_kg = json["title_kg"].stringValue
        self.title_uz = json["title_uz"].stringValue
        self.title_en = json["title_en"].stringValue
        self.title_tj = json["title_tj"].stringValue
        
        self.content_ru = json["content_ru"].stringValue
        self.content_kg = json["content_kg"].stringValue
        self.content_uz = json["content_uz"].stringValue
        self.content_en = json["content_en"].stringValue
        self.content_tj = json["content_tj"].stringValue
        
    }
}

struct Accidents {
    var array: Array = Array<Accident>()
    
    init(json:JSON) {
        let jsonArr:[JSON] = json.arrayValue
        for json in jsonArr {
            array.append(Accident(json:json))
        }
    }
}
