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
    var organizations: Organizations?
    var regions: Regions?
    
    var before: Accidents?
    var during: Accidents?
    var arriving: Accidents?
    var accidents: Accidents?
    var date: Date?
    
    init(json: JSON) {
        self.groups = Groups(json: json["groups"] as JSON)
        self.citizenship = Citizens(json: json["citizenship"] as JSON)
        self.organizations = Organizations(json: json["organizations"] as JSON)
        self.regions = Regions(json: json["regions"] as JSON)
        
        self.before = Accidents(json: json["before"] as JSON)
        self.during = Accidents(json: json["during"] as JSON)
        self.arriving = Accidents(json: json["arriving"] as JSON)
        self.accidents = Accidents(json: json["accident"] as JSON)
        self.date = convert(jsonDate: json["date"].stringValue)
        
    }
    
    fileprivate func convert (jsonDate: String) -> Date{
        
        let pattern = "\\\\?/Date\\((\\d+)(([+-]\\d{2})(\\d{2}))?\\)\\\\?/"
        let regex = try! NSRegularExpression(pattern: pattern)
        guard let match = regex.firstMatch(in: jsonDate, range: NSRange(location: 0, length: jsonDate.utf16.count)) else {
            return Date()
        }
        let dateString = (jsonDate as NSString).substring(with: match.range(at: 1))
        let timeStamp = Double(dateString)! / 1000.0
        let date = Date(timeIntervalSince1970: timeStamp)
        return date
    }
}
