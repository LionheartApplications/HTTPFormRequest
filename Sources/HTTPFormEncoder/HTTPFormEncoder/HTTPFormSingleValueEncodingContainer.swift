//
//  HTTPFormSingleValueEncodingContainer.swift
//  HTTPFormEncoder
//
//  Created by Richard Stelling on 18/07/2018.
//  Copyright © 2018 Lionheart Applications Ltd. All rights reserved.
//

import Foundation

struct HTTPFormSingleValueEncodingContainer: SingleValueEncodingContainer {
    
    var codingPath: [CodingKey]
    let encoder: HTTPFormEncoder
    let containerName: String
    
    internal init(referencing encoder: HTTPFormEncoder, codingPath: [CodingKey], name: String) {
        self.encoder = encoder
        self.codingPath = codingPath
        self.containerName = name
    }
    
    mutating func encodeNil() throws {
        print("nil… skipping!)")
    }
    
    mutating func encode(_ value: Bool) throws {
        encoder.parameters.append((containerName, try encoder.box_(value)))
    }
    
    mutating func encode(_ value: String) throws {
        encoder.parameters.append((containerName, try encoder.box_(value)))
    }
    
    mutating func encode(_ value: Double) throws {
        encoder.parameters.append((containerName, try encoder.box_(value)))
    }
    
    mutating func encode(_ value: Float) throws {
        encoder.parameters.append((containerName, try encoder.box_(value)))
    }
    
    mutating func encode(_ value: Int) throws {
        encoder.parameters.append((containerName, try encoder.box_(value)))
    }
    
    mutating func encode(_ value: Int8) throws {
        encoder.parameters.append((containerName, try encoder.box_(value)))
    }
    
    mutating func encode(_ value: Int16) throws {
        encoder.parameters.append((containerName, try encoder.box_(value)))
    }
    
    mutating func encode(_ value: Int32) throws {
        encoder.parameters.append((containerName, try encoder.box_(value)))
    }
    
    mutating func encode(_ value: Int64) throws {
        encoder.parameters.append((containerName, try encoder.box_(value)))
    }
    
    mutating func encode(_ value: UInt) throws {
        encoder.parameters.append((containerName, try encoder.box_(value)))
    }
    
    mutating func encode(_ value: UInt8) throws {
        encoder.parameters.append((containerName, try encoder.box_(value)))
    }
    
    mutating func encode(_ value: UInt16) throws {
        encoder.parameters.append((containerName, try encoder.box_(value)))
    }
    
    mutating func encode(_ value: UInt32) throws {
        encoder.parameters.append((containerName, try encoder.box_(value)))
    }
    
    mutating func encode(_ value: UInt64) throws {
        encoder.parameters.append((containerName, try encoder.box_(value)))
    }
    
    mutating func encode<T>(_ value: T) throws where T : Encodable {

        //self.encoder.parameters[self.containerName] = try encoder.box( value )
        //print("VLAUE: \(value)")
        //fatalError("NOT IMP")
        
        encoder.parameters.append((containerName, try encoder.box_(value)))
        
        //self.encoder.parameters[self.containerName] = try encoder.box_( value )
    }
}
