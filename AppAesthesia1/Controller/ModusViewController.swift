//
//  ModusViewController.swift
//  AppAesthesia1
//
//  Created by Christian Popp on 14.07.19.
//  Copyright © 2019 Christian Popp. All rights reserved.
//

import UIKit
import Firebase

class ModusViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    
    @IBOutlet var EingangsTableView: UITableView!
    @IBOutlet var Constraint: NSLayoutConstraint!
    @IBOutlet var OKButton: UIButton!
    @IBOutlet var eingabeTextfeld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO: Set yourself as delegate and datasource here:
        EingangsTableView.delegate = self
        EingangsTableView.dataSource = self
        
        
        eingabeTextfeld.delegate = self
        
        
        //TODO: Register your CustomTableViewCell here:
        EingangsTableView.register(UINib(nibName : "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
    }
    
    /////////////////////////////////////////////////
    
    //TODO: Declare cellForRowAtIndexPath here:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        let messageArray = ["Sender", "Patientenname", "Erkrankung"]
        
        cell.InformationsLAbel.text = messageArray[indexPath.row]
        cell.SymbilImageView.image = UIImage(named: "contact")
        
        
        return cell
        
    }
    
    //TODO: Declare numberOfRowsInSection here:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        Constraint.constant = 320
        view.layoutIfNeeded()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    
    @IBAction func logOutPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        }catch{
            print("error: there was a problem signing out")
        }
        guard (navigationController?.popToRootViewController(animated: true)) != nil
            
            else{
                print("No View Controllers to pop off")
                return
        }
        
    }
    
}
