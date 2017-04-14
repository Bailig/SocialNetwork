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
            print(user.email)
            print(user.displayName)
        })
    }

}

