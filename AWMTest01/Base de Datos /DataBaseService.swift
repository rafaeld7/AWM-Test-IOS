//
//  DataBaseService.swift
//  AWMTest01
//
//  Created by AWM Solutions on 9/26/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import Foundation
import Firebase


class DatabaseService{
    
    static let shared = DatabaseService()
    private init() { }
    
    let postsReference = Database.database().reference().child("posts")
    let beersReference = Database.database().reference().child("beers")

}
//
