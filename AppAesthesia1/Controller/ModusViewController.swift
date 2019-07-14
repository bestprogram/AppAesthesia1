//
//  ModusViewController.swift
//  AppAesthesia1
//
//  Created by Christian Popp on 14.07.19.
//  Copyright © 2019 Christian Popp. All rights reserved.
//

import UIKit
import Firebase

class ModusViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var EingangsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO: Set yourself as delegate and datasource here:
        EingangsTableView.delegate = self
        EingangsTableView.dataSource = self
        
        //TODO: Register your CustomTableViewCell here:
        EingangsTableView.register(UINib(nibName : "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
    }
    
    /////////////////////////////////////////////////
    
    //TODO: Declare cellForRowAtIndexPath here:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        let messageArray = ["Sender", "Patientenname", "Erkrankung"]
        
        cell.InformationsLAbel.text = messageArray[indexPath.row]
        
        return cell
        
    }
    
    //TODO: Declare numberOfRowsInSection here:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
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
