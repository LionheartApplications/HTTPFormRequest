//
//  HTTPFormEncoder.swift
//  HTTPFormEncoder
//
//  Created by Richard Stelling on 10/07/2018.
//  Copyright © 2018 Lionheart Applications Ltd. All rights reserved.
//

import Foundation

extension CodingUserInfoKey {
    static let ContainerName = CodingUserInfoKey(rawValue: "ContainerName.HTTPFormEncoder")!
}

public class HTTPFormEncoder: Encoder {
    
    public var codingPath: [CodingKey] = []
    
    public var userInfo: [CodingUserInfoKey : Any] = [:]
    
    // This is an arrya so it can hold multiple parama keyed with `name[]` etc
    var parameters: [(String, String)] = []
    
    // Config
    public typealias BoolBoxValue = (`true`: String, `false`: String)
    public var boolBoxValues: BoolBoxValue = (true: "true", false: "false")
    
    public init(codingPath: [CodingKey] = []) {
        self.codingPath = codingPath
    }
    
    public func encode<T>(_ value: T) throws -> [(String, String)] where T : Encodable {
        try value.encode(to: self)
        return parameters
    }
    
    func box(_ value: Bool)   -> String { "\(value ? boolBoxValues.true : boolBoxValues.false)" }
    func box(_ value: Int)    -> String { "\(value)" }
    func box(_ value: Int8)   -> String { "\(value)" }
    func box(_ value: Int16)  -> String { "\(value)" }
    func box(_ value: Int32)  -> String { "\(value)" }
    func box(_ value: Int64)  -> String { "\(value)" }
    func box(_ value: UInt)   -> String { "\(value)" }
    func box(_ value: UInt8)  -> String { "\(value)" }
    func box(_ value: UInt16) -> String { "\(value)" }
    func box(_ value: UInt32) -> String { "\(value)" }
    func box(_ value: UInt64) -> String { "\(value)" }
    func box(_ value: Float) -> String { "\(value)" }
    func box(_ value: Double) -> String { "\(value)" }
    func box(_ value: String) -> String { value }
    
    func box_<T: Encodable>(_ value: T) throws -> String /*where T : Encodable*/ {
        
        if T.self == Int.self {
            return box(value as! Int)
        }
        if T.self == Int64.self { //TODO: all other ints
            return box(value as! Int64)
        }
        else if T.self == Double.self {
            return box(value as! Double)
        }
        else if T.self == Float.self {
            return box(value as! Float)
        }
        else if T.self == Bool.self {
            return box(value as! Bool)
        }
        else if T.self == String.self {
            return box(value as! String)
        }
        else {
            fatalError()
        }
    }
    
    func box<T>(_ value: T, name: String) throws where T : Encodable {
        self.userInfo[.ContainerName] = name
        try value.encode(to: self)
    }
}

extension HTTPFormEncoder /* Encoder Overrides */ {
    
    public func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
        
        var containerName: String? = codingPath.first?.stringValue
        
        if let name = containerName {
            containerName = codingPath[1...].reduce(name) { $0 + "[\($1.stringValue)]" }
        }
        
        let container = HTTPFormKeyedEncodingContainer<Key>(referencing: self, codingPath: codingPath, name: containerName)
        return KeyedEncodingContainer(container)
    }
    
    public func unkeyedContainer() -> UnkeyedEncodingContainer {
        let container = HTTPFormUnkeyedEncodingContainer(referencing: self, codingPath: codingPath, name: userInfo[.ContainerName] as! String)
        return container
    }
    
    public func singleValueContainer() -> SingleValueEncodingContainer {
        
        var containerName: String? = codingPath.first?.stringValue
        
        if let name = containerName {
            containerName = codingPath[1...].reduce(name) { $0 + "[\($1.stringValue)]" }
        }
        
        return HTTPFormSingleValueEncodingContainer(referencing: self, codingPath: codingPath, name: containerName ?? "UNSUPPORTED")
    }
    
    public func nestedContainer<NestedKey, Key>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> {
        fatalError("NOT IMP")
    }
    
    public func nestedUnkeyedContainer<Key>(forKey key: Key) -> UnkeyedEncodingContainer {
        fatalError("NOT IMP")
    }
}
