//
//  CustomTableViewCell.swift
//  AppAesthesia1
//
//  Created by Christian Popp on 14.07.19.
//  Copyright © 2019 Christian Popp. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet var HintergrundUIView: UIView!
    @IBOutlet var InformationsLAbel: UILabel!
    @IBOutlet var SymbilImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
