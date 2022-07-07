//
//  UserDefaultsStorage.swift
//  UserDefaultsAbstraction
//
//  Created by Gabriela Coelho (Contractor) on 07/07/22.
//

import Foundation

final class UserDefaultsStorage: StorageProvider {

    private var wrapper: UserDefaultsProvider

    init(wrapper: UserDefaultsProvider = UserDefaultsWrapper()) {
        self.wrapper = wrapper
    }

    func save<Value>(_ value: Value, for key: String) where Value : Persistable {
        wrapper.defaults.set(value.storedValue, forKey: key)
    }

    func delete(for key: String) {
        wrapper.defaults.removeObject(forKey: key)
    }

    func fetch<Value>(for key: String) -> Value? where Value : Persistable {
        guard let fetched: Any = wrapper.defaults.object(forKey:key) else { return nil }

        return Value(storedValue: fetched as! Value.StoredValue)
    }

    func clear() {
        wrapper.defaults.clear(for: wrapper.bundleIdentifier)
    }

    func register<Value: Persistable>(value: Value, key: String) {
        wrapper.register(value: value, key: key)
    }
}

extension UserDefaults {
    func clear(for bundleIdentifier: String?) {
        if let bundleIdentifier = bundleIdentifier {
            self.removePersistentDomain(forName: bundleIdentifier)
        }
    }
}

