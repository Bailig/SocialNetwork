//
//  MainViewController.swift
//  SocialNetwork
//
//  Created by Bailig Abhanar on 2017-04-14.
//  Copyright © 2017 Bailig Abhanar. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import FirebaseAuth

class MainViewController: UIViewController {

    @IBAction func logOutBtnPressed(_ sender: Any) {
        let isKeychainRemoved: Bool = KeychainWrapper.standard.remove(key: Key.userId.rawValue)
        if isKeychainRemoved {
            do {
                try FIRAuth.auth()?.signOut()
            } catch (let error) {
                print("error: \(error.localizedDescription)")
            }
            dismiss(animated: true, completion: nil)
        } else {
            print("error: unable to remove keychain for \(Key.userId.rawValue)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
