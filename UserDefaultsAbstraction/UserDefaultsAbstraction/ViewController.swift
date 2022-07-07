//
//  ViewController.swift
//  UserDefaultsAbstraction
//
//  Created by Gabriela Coelho (Contractor) on 04/07/22.
//

import UIKit

// Example that works
@propertyWrapper
struct Storage {
    private let key: String
    private let defaultValue: String
    
    init(key: String, defaultValue: String) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: String {
        get {
            return UserDefaults.standard.string(forKey: key) ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet var newSwitch: UISwitch!
    
    private let userDefaultsStorage = UserDefaultsStorage()
    
    @Storage(key: "lulul", defaultValue: "lulu")
    var luluValue: String

//    @PersistableValue(defaultValue: "lulul", key: "lulu")
//    var luluValue: String

    override func viewDidLoad() {
        super.viewDidLoad()
        verifyUserDefaults()
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if sender.isOn {
            userDefaultsStorage.save("lalal", for: "lala")   // This works
            luluValue = "lulul2"
            verifyUserDefaults()
        } else {
            userDefaultsStorage.delete(for: "lala") // This works
            luluValue = "lulu"
            verifyUserDefaults()
        }
    }
    
    func verifyUserDefaults() {
        if _luluValue.wrappedValue == "lulul2" {
            view.backgroundColor = .red
            print(_luluValue.wrappedValue)
        } else {
            view.backgroundColor = .blue
            print(_luluValue.wrappedValue)
        }
        
        
        // This works
//        if let lala: String.StoredValue = userDefaultsStorage.fetch(for: "lala") {
//            view.backgroundColor = .red
//            newSwitch.isOn = true
//            print(_luluValue.wrappedValue)
//            print(lala.storedValue)
//        } else {
//            newSwitch.isOn = false
//            view.backgroundColor = .blue
//            print(_luluValue.wrappedValue)
//        }
    }
}

