//
//  UserDefaultsWrapper.swift
//  UserDefaultsAbstraction
//
//  Created by Gabriela Coelho (Contractor) on 07/07/22.
//

import Foundation

final class UserDefaultsWrapper: UserDefaultsProvider {
    var defaults = UserDefaults.standard
    var bundleIdentifier = Bundle.main.bundleIdentifier

    func register<Value>(value: Value, key: String) where Value : Persistable {
        defaults.register(defaults: [key: value.storedValue])
    }
}
