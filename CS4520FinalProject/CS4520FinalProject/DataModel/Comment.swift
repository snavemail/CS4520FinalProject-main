//
//  Comment.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/21/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Comment: Codable{
    @DocumentID var id: String?
    var user: String
    var text: String
    
    init(id: String? = nil, user: String, text: String) {
        self.id = id
        self.user = user
        self.text = text
    }
    
}
