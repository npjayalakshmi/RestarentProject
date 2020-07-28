//
//  LunchVC.swift
//  RestarentProject
//
//  Created by Jayalakshmi NP on 28/07/20.
//  Copyright © 2020 natarajan k. All rights reserved.
//

import UIKit

class LunchVC: UIViewController {
    
    
    @IBOutlet weak var restarentName: UILabel!
    
    @IBOutlet weak var categoryName: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    var restarents:Restarents!
    override func viewDidLoad() {
        super.viewDidLoad()

        restarentName.text = restarents.name
        categoryName.text = restarents?.category
        addressLabel.text = restarents.location.address
//        phoneNumberLabel.text = restarents.contact.phone
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
