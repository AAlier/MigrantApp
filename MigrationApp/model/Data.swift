//
//  Data.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/27/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Data {
    var groups: Groups?
    var citizenship: Citizens?
    
    init(json: JSON) {
        self.groups = Groups(json: json["groups"] as JSON)
        self.citizenship = Citizens(json: json["citizenship"] as JSON)
    }
}
