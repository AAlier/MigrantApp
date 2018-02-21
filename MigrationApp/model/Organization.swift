//
//  Organization.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import Foundation
import SwiftyJSON

class Organization {
    var regionId : Int
    var region : String
    var city : String
    var latitude : String
    var longitude : String
    var organization : String
    var address : String
    var contact_phones : String
    var phones: Array<String>
    var email : String
    var website : String
    var comment : String
    
    init(json : JSON) {
        regionId = json["id"].intValue
        region = json["region"].stringValue
        city = json["city"].stringValue
        latitude = json["latitude"].stringValue
        longitude = json["longitude"].stringValue
        organization = json["organization"].stringValue
        address = json["address"].stringValue
        contact_phones = json["contact_phones"].stringValue
        phones = json["phones"].arrayValue.map { $0.stringValue}
        email = json["email"].stringValue
        website = json["website"].stringValue
        comment = json["comment"].stringValue

    }
}

class Organizations {
    var array : Array = Array<Organization>()
    
    init(json : JSON) {
        let jsonArray : [JSON] = json.arrayValue
        for json in jsonArray {
            let tempObj = Organization(json : json)
            array.append(tempObj)
        }
    }
}
