//
//  Workout.swift
//  CS4520FinalProject
//
//  Created by Liam Evans on 6/25/23.
//

import Foundation

struct Workout: Codable, Equatable {
    var exercise: String
    var weight: Int
    var sets: Int
    var reps: Int
    
    init(exercise: String, weight: Int, sets: Int, reps: Int) {
        self.exercise = exercise
        self.weight = weight
        self.sets = sets
        self.reps = reps
    }
}
