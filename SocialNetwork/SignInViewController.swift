//
//  SignInViewController.swift
//  SocialNetwork
//
//  Created by Bailig Abhanar on 2017-04-13.
//  Copyright © 2017 Bailig Abhanar. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import FirebaseAuth
import SwiftKeychainWrapper

class SignInViewController: UIViewController, Signinable {

    let userIdKey = "userId"
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func facebookLoginBtnPressed(_ sender: Any) {
        let fBLoginManager = FBSDKLoginManager()
        
        fBLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            guard let result = result else {
                print("error: unable to authenticate with facebook!")
                if let error = error {
                    print("error\(error.localizedDescription)")
                }
                return
            }
            if !result.isCancelled {
                // create credential with token
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(withCredential: credential)
            }
        }
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        // authenticate user
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            guard let user = user else {
                if let error = error {
                    print("error: \(error.localizedDescription)")
                }
                return
            }
            // user authenticated
            // save keychain
            self.saveKeychain(userId: user.uid)
            self.performSegue(withIdentifier: SegueId.mainViewController.rawValue, sender: nil)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if let _ = KeychainWrapper.standard.string(forKey: Key.userId.rawValue) {
            performSegue(withIdentifier: SegueId.mainViewController.rawValue, sender: nil)
        }
    }
    
    

    /// helper
    func firebaseAuth(withCredential credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            guard let user = user else {
                print("error: unable to fetch user")
                if let error = error {
                    print("error: \(error.localizedDescription)")
                }
                return
            }
            // user authenticated
            // save keychain
            self.saveKeychain(userId: user.uid)
            self.performSegue(withIdentifier: SegueId.mainViewController.rawValue, sender: nil)
        })
    }

}

