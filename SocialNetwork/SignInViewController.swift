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

class SignInViewController: UIViewController {

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
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            guard let user = user else {
                if let error = error {
                    print("error: \(error.localizedDescription)")
                }
                return
            }
            print(user.email ?? "user email nil")
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            print(user.email ?? "user email nil")
            print(user.displayName ?? "name nil")
        })
    }

}

