//
//  Restarents.swift
//  RestarentProject
//
//  Created by Jayalakshmi NP on 28/07/20.
//  Copyright © 2020 natarajan k. All rights reserved.
//

import Foundation


struct Restarents:Decodable{
    var backgroundImageURL:String

    let name:String
    let category:String
    let location:location
//    let contact:[contact]

}
struct location:Decodable{
    let address : String
}

//struct contact:Decodable{
//    let phone:String
//    let twitter:String
//}
