//
//  Current.swift
//  Stormy
//
//  Created by Brianna Przybysz on 5/22/15.
//  Copyright (c) 2015 MohammadSUsman. All rights reserved.
//

import Foundation

struct current {
    
    var currentTime : Int
    var temperature :Int
    var humidity : Double
    var percipProbability:Double
    var summary : String
    var icon : String
    
    init(weatherDictionary : NSDictionary){
        let currentWeather  = weatherDictionary["currently"] as NSDictionary
        
        currentTime = currentWeather["time"] as Int
        temperature = currentWeather ["temperature"] as Int
        humidity = currentWeather ["humidity"] as Double
        percipProbability = currentWeather["precipIntensity"] as Double
        summary = currentWeather["summary"] as String
        icon = currentWeather["icon"] as String
    }
    
}
