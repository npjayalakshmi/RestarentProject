//
//  RestarentTableViewCell.swift
//  RestarentProject
//
//  Created by Jayalakshmi NP on 28/07/20.
//  Copyright © 2020 natarajan k. All rights reserved.
//

import UIKit

class RestarentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var restarentName: UILabel!
    
    @IBOutlet weak var restarentImage: UIImageView!
    
    
    @IBOutlet weak var categoryType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
