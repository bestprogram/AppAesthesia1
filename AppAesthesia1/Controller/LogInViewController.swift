//
//  LogInViewController.swift
//  AppAesthesia1
//
//  Created by Christian Popp on 14.07.19.
//  Copyright © 2019 Christian Popp. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    // Textfields pre- linked with IBOutlets
    
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!, completion: { (user, error) in
            if error != nil {
                print(error!)
            }else{
                // success
                print("Login successful!")
                
                self.performSegue(withIdentifier: "geheZuModus", sender: self)
            }
        })
        
    }
}
