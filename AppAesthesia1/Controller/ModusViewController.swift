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
    
    var messageArray = ["Sender", "Patientenname", "Erkrankung"]
    var messageArrayNummer = 0
    
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
        
        cell.InformationsLAbel.text = messageArray[indexPath.row]
        cell.SymbilImageView.image = UIImage(named: "contact")
        
        
        return cell
        
    }
    

    
    
    //TODO: Declare numberOfRowsInSection here:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messageArray.count
    
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        Constraint.constant = 320
        view.layoutIfNeeded()
        
    }
    
    //MARK:- Table View Dlegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(messageArray[indexPath.row])
        print(indexPath.row)
        messageArrayNummer = indexPath.row
        
        
      
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.cellForRow(at: indexPath)
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
    
    
    @IBAction func OKButton(_ sender: UIButton) {
    
        messageArray[messageArrayNummer] = eingabeTextfeld.text!
        EingangsTableView.reloadData()
        print(messageArray)
        
        
    }
    
}
