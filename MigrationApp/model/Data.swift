//
//  Data.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import Foundation
import SwiftyJSON

class Data {
    
    var lang : String
    var citizens : Citizens
    
    init(json: JSON) {
        lang = json["lang"].stringValue
        citizens = Citizens(json : json["citizens"])
        
    }
}

class Datas {
    var array : Array = Array<Data>()
    
    init(json : JSON) {
        let jsonArray : [JSON] = json.arrayValue
        for json in jsonArray {
            let tempObj = Data(json : json)
            array.append(tempObj)
        }
    }
}
