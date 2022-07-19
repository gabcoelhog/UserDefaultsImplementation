//
//  UserDefaultsStorage.swift
//  UserDefaultsAbstraction
//
//  Created by Gabriela Coelho (Contractor) on 07/07/22.
//

import Foundation

public final class UserDefaultsStorage<T>: StorageProvider {
    public typealias PersistentType = T
    
    private var wrapper: UserDefaultsProvider

    public init(wrapper: UserDefaultsProvider = UserDefaultsWrapper()) {
        self.wrapper = wrapper
    }

//    public func save<Value>(_ value: Value, for key: String) where Value : Persistable {
//        wrapper.defaults.set(value.persistentValue, forKey: key)
//    }
//
    public func delete(for key: String) {
        wrapper.defaults.removeObject(forKey: key)
    }

    public func save(_ value: T, for key: String) {
        wrapper.defaults.set(value, forKey: key)
    }
    
    public func fetch(for key: String) -> T? {
        return wrapper.defaults.object(forKey: key) as? PersistentType
    }

//    public func fetch<Value>(for key: String) -> Value? where Value : Persistable {
//        guard let fetched: Any = wrapper.defaults.object(forKey:key) else { return nil }
//
//        return Value(storedValue: fetched as! Value.StoredValue)
//    }
//
    public func clear() {
        wrapper.defaults.clear(for: wrapper.bundleIdentifier)
    }

    public func register<Value: Persistable>(value: Value, key: String) {
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

