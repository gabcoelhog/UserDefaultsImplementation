//
//  Persistence.swift
//  UserDefaultsAbstraction
//
//  Created by Gabriela Coelho (Contractor) on 12/07/22.
//

import Foundation
import Foundation

// MARK: Persistent
/// A simple struct which takes a value and persists it across sessions.
public struct Persistent<T>: Persistable {
    
    /// The type of the persistent value.
    public typealias PersistentType = T
    private var storageProvider: StorageProvider
    
    /// Alias around `persistentValue` and `setPersistentValue:`.
    public var value: T {
        set {
            persistentValue = newValue
        }
        get {
            return persistentValue
        }
    }
    
    public var persistentValue: PersistentType {
        set {
            storageProvider.save(newValue, for: persistentKey)
        }
        
        get {
            storageProvider.fetch(for: persistentKey) as! PersistentType
        }
    }
    
    /// The default persistent value.
    public let defaultValue: T
    
    /// The key used to store the persistent value.
    public let persistentKey: String
    
    /**
     Creates a new Persistent value struct.
     
     - parameter value: The initial value. Used to register a default value with NSUserDefaults.
     - parameter key: The key used to set and get the value in NSUserDefaults.
     */
    public init(value: T, key: String, storageProvider: StorageProvider = UserDefaultsStorage()) {
        self.defaultValue = value
        self.persistentKey = key
        self.storageProvider = storageProvider
        
        self.storageProvider.register(value: value, key: persistentKey)
    }
    
    /// Resets the persistent value to the default persistent value.
    public mutating func resetValue() {
        value = defaultValue
    }
    
}

// MARK: Persistable
/// An abstract protocol which can be used to add a persistent value to existing classes and structs.
public protocol Persistable {
    
    /// The type of the persistent value
    associatedtype PersistentType
    
    /// The key used to set the persistent value in NSUserDefaults
    var persistentValue: PersistentType { get set }
    var persistentKey: String { get }
    
}

extension Persistable {

    /// Set and get the persistent value from NSUserDefaults.
    ///
    /// Note that the setter is declared `nonmutating`: this is so we can implement this protocol on classes.
    /// Value semantics will be preserved: `didSet` will still get called when `Persistent`'s `value` is set.
//    public var persistentValue: PersistentType {
//        nonmutating set {
//            UserDefaults.standard.set(newValue, forKey: persistentKey)
//        }
//        get {
//            return UserDefaults.standard.object(forKey: persistentKey) as! PersistentType
//        }
//    }
//
//    /// Register a default value with NSUserDefaults.
//    ///
//    public func register(defaultPersistentValue value: PersistentType) {
//
//        UserDefaults.standard.register(defaults: [persistentKey: value])
//    }

}
