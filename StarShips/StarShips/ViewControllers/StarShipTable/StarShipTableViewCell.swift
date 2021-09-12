//
//  StarShipTableViewCell.swift
//  StarShips
//
//  Created by Talha Ghous on 11/9/21.
//  Copyright © 2021 Talha Ghous. All rights reserved.
//

import UIKit

class StarShipTableViewCell: UITableViewCell  {

    @IBOutlet weak var starShipName: UILabel!
    @IBOutlet weak var starShipModel: UILabel!
    @IBOutlet weak var starShipMenufacturer: UILabel!
   // override var reuseIdentifier: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
