//
//  FriendProfileTableViewController.swift
//  CS4520FinalProject
//
//  Created by Liam Evans on 6/25/23.
//

import UIKit

extension FriendProfileViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewProfileFriendsID, for: indexPath) as! FriendProfileTableViewCell
        
        // setup labels in cell
        let post = posts[indexPath.row]
        cell.labelName.text = self.currentUser.name
        cell.labelDescription.text = post.caption
        
        let workout = post.workout
        
        cell.labelExercises.numberOfLines = workout.count
        cell.labelWeights.numberOfLines = workout.count
        cell.labelSets.numberOfLines = workout.count
        cell.labelReps.numberOfLines = workout.count
        
        var cellExercise = ""
        var cellWeight = ""
        var cellSet = ""
        var cellRep = ""
        
        for (idx, exercise) in workout.enumerated() {
          if idx == workout.endIndex-1 {
              cellExercise += exercise.exercise
              cellWeight += String(exercise.weight)
              cellSet += String(exercise.sets)
              cellRep += String(exercise.reps)
          } else {
              cellExercise += exercise.exercise + "\n"
              cellWeight += String(exercise.weight) + "\n"
              cellSet += String(exercise.sets) + "\n"
              cellRep += String(exercise.reps) + "\n"
          }
        
        }

        cell.labelExercises.text = cellExercise
        cell.labelWeights.text = cellWeight
        cell.labelSets.text = cellSet
        cell.labelReps.text = cellRep
        
        if let urlProfile = self.currentUser.photo {
            cell.imageProfile.loadRemoteImage(from: urlProfile)
        } else {
            cell.imageProfile.image = Configs.defaultPicture
        }
        
        if let url = post.image {
            cell.imagePost.loadRemoteImage(from: url)
        } else {
            cell.imagePost.image = Configs.defaultPicture
        }
        
        return cell
    }
    
}
