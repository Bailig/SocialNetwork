//
//  Signinable.swift
//  SocialNetwork
//
//  Created by Bailig Abhanar on 2017-04-14.
//  Copyright © 2017 Bailig Abhanar. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftKeychainWrapper

protocol Signinable { }

extension Signinable where Self: UIViewController {
    func saveKeychain(userId: String) {
        let isKeychainSaved: Bool = KeychainWrapper.standard.set(userId, forKey: Key.userId.rawValue)
        if !isKeychainSaved {
            print("error: unable to save keychain!")
        }
    }
}
