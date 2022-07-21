//
//  PropertyWrappers.swift
//  UserDefaultsAbstraction
//
//  Created by Gabriela Coelho (Contractor) on 07/07/22.
//

import Foundation

//Property Wrappers - There is still some work to do here
@propertyWrapper
struct PersistableOptionalValue<Value: Persistable> {
    private let provider: StorageProvider

    /// The key for the value in `UserDefaults`.
    let key: String

    /// The value retreived from `UserDefaults`, if any exists.
    private let defaultValue: Value
    var wrappedValue: Value? {
        get {
            provider.fetch(for: key) ?? defaultValue
        }
        set {
            if let newValue = newValue {
                provider.save(newValue, for: self.key)
            } else {
                provider.delete(for: self.key)
            }
        }
    }

    init(wrappedValue defaultValue: Value, key keyName: String, provider: StorageProvider = UserDefaultsStorage()) {
        self.key = keyName
        self.provider = provider
        self.defaultValue = defaultValue
    }
}

// I was trying to avoid having to property wrappers but I couldn't find a good solution
//extension PersistableOptionalValue {
//    init(key: String, provider: StorageProvider = UserDefaultsStorage()) {
//        self.init(wrappedValue: nil, key: key, provider: provider)
//    }
//}

@propertyWrapper
struct PersistableValue<Value: Persistable> {
    private let provider: StorageProvider = UserDefaultsStorage()

    /// The key for the value in `UserDefaults`.
    let key: String
    let defaultValue: Value

    /// The value retreived from `UserDefaults`, if any exists.
    var wrappedValue: Value {
        get {
            return provider.fetch(for: key)! as Value
        }
        set {
            provider.save(newValue, for: self.key)
        }
    }

    init(defaultValue: Value, key keyName: String, provider: StorageProvider? = nil) {
        self.key = keyName
        self.defaultValue = defaultValue
        
    }
}


struct GLUserDefaultsValue<ValueType: Persistable> {

    private let userDefaultsStorage: StorageProvider
    private let key: String
    private let defaultValue: ValueType

    var wrappedValue: ValueType? {
        get {
            userDefaultsStorage.fetch(for: key)
        }
        set {
            guard let newValue = newValue else { return }
            userDefaultsStorage.save(newValue, for: key)
        }
    }

    init(key: String, defaultValue: ValueType, userDefaultsStorage: StorageProvider = UserDefaultsStorage()) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefaultsStorage = userDefaultsStorage
    }
}

//protocol UserDefaultsSafetyKeysProtocol {
//    var hasSeenFamilyLocationOnboarding: Bool { get set }
//}
//
//class UserDefaultsSafetyKeys: UserDefaultsSafetyKeysProtocol {
//    var hasSeenFamilyLocationOnboarding: Bool
//}

