//
//  UserDefaultsWrapper.swift
//  UserDefaultsAbstraction
//
//  Created by Gabriela Coelho (Contractor) on 07/07/22.
//

import Foundation

public final class UserDefaultsWrapper: UserDefaultsProvider {
    public var defaults: UserDefaults
    public var bundleIdentifier: String?

    public init(defaults: UserDefaults = UserDefaults.standard, bundleIdentifier: String? = Bundle.main.bundleIdentifier) {
        self.defaults = defaults
        self.bundleIdentifier = bundleIdentifier
    }
    
    public func register<Value>(value: Value, key: String) where Value : Persistable {
        defaults.register(defaults: [key: value.persistentValue])
    }
}
