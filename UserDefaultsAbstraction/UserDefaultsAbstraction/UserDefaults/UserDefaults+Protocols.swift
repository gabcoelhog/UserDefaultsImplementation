//
//  UserDefaults.swift
//  UserDefaultsAbstraction
//
//  Created by Gabriela Coelho (Contractor) on 04/07/22.
//

import Foundation

public protocol Persistable {
    associatedtype StoredValue

    var storedValue: StoredValue { get }
    init(storedValue: StoredValue)
}

extension Persistable where Self: RawRepresentable, Self.RawValue: Persistable {
    public var storedValue: RawValue.StoredValue { self.rawValue.storedValue }

    public init(storedValue: RawValue.StoredValue) {
        self = Self(rawValue: Self.RawValue(storedValue: storedValue))!
    }
}

// MARK: - StorageProvider

protocol StorageProvider {
    func save<Value: Persistable>(_ value: Value, for key: String)
    func delete(for key: String)
    func fetch<Value: Persistable>(for key: String) -> Value?
    func clear()
}

// MARK: - UserDefaultsProvider

protocol UserDefaultsProvider {
    var defaults: UserDefaults { get set }
    var bundleIdentifier: String? { get set }

    func register<Value: Persistable>(value: Value, key: String)
}


