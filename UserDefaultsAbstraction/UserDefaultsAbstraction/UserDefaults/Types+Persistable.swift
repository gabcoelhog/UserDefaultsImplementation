////
////  Types+Persistable.swift
////  UserDefaultsAbstraction
////
////  Created by Gabriela Coelho (Contractor) on 07/07/22.
////
//
//import Foundation
//
//extension Bool: Persistable {
//    public var storedValue: Self { self }
//
//    public init(storedValue: Self) {
//        self = storedValue
//    }
//}
//
//extension Int: Persistable {
//    public var storedValue: Self { self }
//
//    public init(storedValue: Self) {
//        self = storedValue
//    }
//}
//
//extension UInt: Persistable {
//    public var storedValue: Self { self }
//
//    public init(storedValue: Self) {
//        self = storedValue
//    }
//}
//
//extension Float: Persistable {
//    public var storedValue: Self { self }
//
//    public init(storedValue: Self) {
//        self = storedValue
//    }
//}
//
//extension Double: Persistable {
//    public var storedValue: Self { self }
//
//    public init(storedValue: Self) {
//        self = storedValue
//    }
//}
//
//extension String: Persistable {
//    public var storedValue: Self { self }
//
//    public init(storedValue: Self) {
//        self = storedValue
//    }
//}
//
//extension URL: Persistable {
//    public var storedValue: Self { self }
//
//    public init(storedValue: Self) {
//        self = storedValue
//    }
//}
//
//extension Date: Persistable {
//    public var storedValue: Self { self }
//
//    public init(storedValue: Self) {
//        self = storedValue
//    }
//}
//
//extension Data: Persistable {
//    public var storedValue: Self { self }
//
//    public init(storedValue: Self) {
//        self = storedValue
//    }
//}
//
//extension Array: Persistable where Element: Persistable {
//    public var storedValue: [Element.StoredValue] {
//        self.map { $0.storedValue }
//    }
//
//    public init(storedValue: [Element.StoredValue]) {
//        self = storedValue.map { Element(storedValue: $0) }
//    }
//}
//
//extension Set: Persistable where Element: Persistable {
//    public var storedValue: [Element.StoredValue] {
//        self.map { $0.storedValue }
//    }
//
//    public init(storedValue: [Element.StoredValue]) {
//        self = Set(storedValue.map { Element(storedValue: $0) })
//    }
//}
//
//extension Dictionary: Persistable where Key == String, Value: Persistable {
//    public var storedValue: [String: Value.StoredValue] {
//        self.mapValues { $0.storedValue }
//    }
//
//    public init(storedValue: [String: Value.StoredValue]) {
//        self = storedValue.mapValues { Value(storedValue: $0) }
//    }
//}
//
