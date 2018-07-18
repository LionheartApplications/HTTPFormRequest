//
//  Structures.swift
//  HTTPFormEncoder-Tests
//
//  Created by Richard Stelling on 10/07/2018.
//  Copyright © 2018 Lionheart Applications Ltd. All rights reserved.
//

import Foundation

struct Inner: Codable {
    let foo: String
    let bar: Int
}

struct Deep: Codable {
    let scale: Double
    let planet: Inner
}

struct JSON: Codable {
    let foo: String
    let bar: String
    let moo: Int
    let moo8: Int8
    let moo16: Int16
    let moo32: Int32
    let moo64: Int64
    
    let loo: Float
    let boo: Double
    
    let baz0: Bool
    let baz1: Bool
    
    let zaz: String?
    let zaz1: Int?
    
    let blup: [String]
    
    let blop: Inner
    
    let deep: Deep
}

struct NestedSingleValues: Codable {
    enum Name: String, Codable {
        case funk = "funk"
        case soul = "soul"
    }
    
    enum Pie: Int, Codable {
        case 🍎 = 0
        case 🎃 = 1599
    }
    
    let name: Name
    let food: Pie
}

struct SingleValues: Codable {
    
    enum Label: String, Codable {
        case abc1 = "💩"
        case efg = "🤖"
    }
    
    enum Values: Int, Codable {
        case egg = 128
        case toast = 256
    }
    
    let label: Label
    //let more: [Label] //this fails
    
    let info: NestedSingleValues
    
    let val: Values
}

// ---------------------------------------------------------------------------------------------------------------------------------------------------//

