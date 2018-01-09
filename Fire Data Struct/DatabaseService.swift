//
//  DatabaseService.swift
//  Fire Data Struct
//
//  Created by Lucas Caron Albarello on 19/12/17.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import Foundation
import Firebase

class DatabaseService{
    static let shared = DatabaseService()
    private init (){}
    let postRef = Database.database().reference().child("posts")
}
