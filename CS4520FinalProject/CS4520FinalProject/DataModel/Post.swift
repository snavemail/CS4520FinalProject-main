//
//  Post.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/21/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Post: Codable{
    @DocumentID var id: String?
    var caption: String
    var image: URL?
    var workout = [Workout]()
    
    init(id: String? = nil, caption: String, image: URL? = nil, workout: [Workout]) {
        self.id = id
        self.caption = caption
        self.image = image
        self.workout = workout
    }
}
