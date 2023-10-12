//
//  User.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/21/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable{
    @DocumentID var id: String?
    var name: String
    var email: String
    var age: Int
    var photo: URL?
    
    init(id: String? = nil, name: String, email: String, age: Int, photo: URL? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.age = age
        self.photo = photo
    }
}
