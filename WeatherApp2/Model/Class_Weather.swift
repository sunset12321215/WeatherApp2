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

class condition: Mappable {
    
    var text : String?
    
    required init?(map: Map) {  }
    
    func mapping(map: Map) {
        text <- map["text"]
    }

}



class day : Mappable
{
    var avgtemp_c : Double?
    var condition : condition?
    
    required init?(map: Map) {  }
    
    func mapping(map: Map) {
        avgtemp_c <- map["avgtemp_c"]
        condition <- map["condition"]
    }
}



class forecastday_child : Mappable
{
    var day : day?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        day <- map["day"]
    }

}




class forecast : Mappable
{
    var forecastday : [forecastday_child]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        forecastday <- map["forecastday"]
    }
    
    
}

class Weather : Mappable
{
    var location : location?
    
    var forecast : forecast?
    
    required init?(map: Map) {    }
    
    func mapping(map: Map) {
        location <- map["location"]
        forecast <- map["forecast"]
    }
}
