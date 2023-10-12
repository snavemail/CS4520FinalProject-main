//
//  ExerciseLoggerController.swift
//  CS4520FinalProject
//
//  Created by Liam Evans on 6/25/23.
//

import Foundation
import UIKit

extension PostScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewExerciseLoggerID, for: indexPath) as! ExerciseLoggerTableViewCell
        
        let workout = exercises[indexPath.row]
        cell.labelExercise.text = workout.exercise
        cell.labelWeight.text = String(workout.weight)
        cell.labelSets.text = String(workout.sets)
        cell.labelReps.text = String(workout.reps)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let workout = exercises[indexPath.row]
        let deleteAlert = UIAlertController(
            title: "Delete Exercise?",
            message: nil,
            preferredStyle: .alert)
            
        //MARK: Sign In Action...
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {(_) in
            
        })
        
        //MARK: Sign In Action...
        let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: {(_) in
            if let index = self.exercises.firstIndex(of: workout) {
                self.exercises.remove(at: index)
            }
            self.postView.tableViewExerciseLogger.reloadData()
        })
        
        //MARK: action buttons...
        deleteAlert.addAction(cancelAction)
        deleteAlert.addAction(deleteAction)
        
        self.present(deleteAlert, animated: true, completion: {() in
            //MARK: hide the alerton tap outside...
            deleteAlert.view.superview?.isUserInteractionEnabled = true
            deleteAlert.view.superview?.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(self.onTapOutsideAlert))
            )
        })
    }
    
    
}
