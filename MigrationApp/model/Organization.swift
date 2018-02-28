//
//  Organization.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/28/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Organization {
    var id : Int = -1
    var name_ru : String?
    var name_kg : String?
    var name_uz : String?
    var name_en : String?
    var name_tj : String?
    var city_ru : String?
    var city_kg : String?
    var city_uz : String?
    var city_en : String?
    var city_tj : String?
    
    var latitude : Double?
    var longitude : Double?
    var address_ru : String?
    var address_kg : String?
    var address_uz : String?
    var address_en : String?
    var address_tj : String?
    
    var contact_person : String?
    var phones: Array<String>?
    
    var email : String?
    var website : String?
    var comment_ru : String?
    var comment_kg : String?
    var comment_uz : String?
    var comment_en : String?
    var comment_tj : String?
    var region : Int = -1
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name_ru = json["name_ru"].stringValue
        self.name_kg = json["name_ru"].stringValue
        self.name_uz = json["name_kg"].stringValue
        self.name_en = json["name_uz"].stringValue
        self.name_tj = json["name_en"].stringValue
        self.city_ru = json["name_tj"].stringValue
        self.city_kg = json["city_ru"].stringValue
        self.city_uz = json["city_kg"].stringValue
        self.city_en = json["city_uz"].stringValue
        self.city_tj = json["city_en"].stringValue
        self.name_ru = json["city_tj"].stringValue
        
        self.latitude = json["latitude"].doubleValue
        self.longitude = json["longitude"].doubleValue
        
        self.address_ru = json["address_ru"].stringValue
        self.address_kg = json["address_kg"].stringValue
        self.address_uz = json["address_uz"].stringValue
        self.address_en = json["address_en"].stringValue
        self.address_tj = json["address_tj"].stringValue
        self.contact_person = json["contact_person"].stringValue
        self.phones = json["phones"].arrayValue.map({$0.stringValue})
        
        self.email = json["email"].stringValue
        self.website = json["website"].stringValue
        
        self.comment_ru = json["comment_ru"].stringValue
        self.comment_kg = json["comment_kg"].stringValue
        self.comment_uz = json["comment_uz"].stringValue
        self.comment_en = json["comment_en"].stringValue
        self.comment_tj = json["comment_tj"].stringValue
        self.region = json["region"].intValue
    }
}

struct Organizations {
    var array: Array = Array<Organization>()
    
    init(json:JSON) {
        let jsonArr:[JSON] = json.arrayValue
        for json in jsonArr {
            array.append(Organization(json:json))
        }
    }
}
