//
//  RegisterViewController.swift
//  AppAesthesia1
//
//  Created by Christian Popp on 14.07.19.
//  Copyright © 2019 Christian Popp. All rights reserved.
//

import UIKit
import ChameleonFramework
import Firebase


class RegisterViewController: UIViewController {

    // Email und Password Outlets
    
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func registerPressed(_ sender: UIButton) {
    
    // Neuen User auf Firebas Database erzeugen
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!, completion: { (user, error) in
            if error != nil {
                print(error!)
            }else{
                // sucess
                print("Registration successful!")
                
                self.performSegue(withIdentifier: "geheZuModus", sender: self)
            }
        })
        
    }
    

}
