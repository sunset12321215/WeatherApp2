//
//  Class_Weather.swift
//  WeatherApp2
//
//  Created by mac on 10/5/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import ObjectMapper

class location : Mappable
{
    var name: String?
    var localtime_epoch: Double?
    var localtime: String?
    
    required init?(map: Map) {  }
    
    func mapping(map: Map) {
        name <- map["name"]
        localtime_epoch <- map["localtime_epoch"]
        localtime <- map["localtime"]
    }
    
    
}

class Weather : Mappable
{
    var location : location?
    
    
    
    required init?(map: Map) {    }
    
    func mapping(map: Map) {
        location <- map["location"]
    }
    
    

}
