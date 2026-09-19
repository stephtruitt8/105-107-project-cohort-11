//
//  User.swift
//  CoHo11JSON
//
//  Created by Stephen Truitt on 9/14/26.
//

import Foundation

struct User: Codable {
    
    var name:String
    var age:Int
    var isActive:Bool
    
    // MARK: We use a codingkey to change the name of out JSON
    
    
    enum CodingKeys: String, CodingKey {
        case name = "First_Name"
        case age = "User_Age"
        case isActive = "is_Active"
    }
}





let newUser:User = User(name: <#T##String#>, age: <#T##Int#>, isActive: <#T##Bool#>)

///
///{
///    name:""
///       age:""
///       isActive:true
///
///   }
///

struct CurrentTemperature: Codable {
    
    let time: String
    let temperature_2m: Double
    let windSpeed10m: Double
    
    enum CodingKeys: String, CodingKey {
        case time 
        case temperature_2m = "temp_2m"
        case windSpeed10m = "wind_speed_10m"
    }
    
}
