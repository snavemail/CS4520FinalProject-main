//
//  FriendRequestTableViewController.swift
//  CS4520FinalProject
//
//  Created by Liam Evans on 6/23/23.
//

import Foundation

import UIKit

extension FriendRequestViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendRequestList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewFriendRequestsID, for: indexPath) as! FriendRequestsTableViewCell 
        
        // setup labels in cell
        let friendRequested = friendRequestList[indexPath.row]
        cell.labelName.text = friendRequested.name
        cell.labelMessage.text = friendRequested.email
        cell.labelDate.text = String(friendRequested.age)
        
        if let url = friendRequested.photo {
            cell.imageProfile.loadRemoteImage(from: url)
        } else {
            cell.imageProfile.image = Configs.defaultPicture
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = friendRequestList[indexPath.row]
        let addFriendAlert = UIAlertController(
            title: "Accept Friend Request?",
            message: nil,
            preferredStyle: .alert)
            
        //MARK: Sign In Action...
        let acceptAction = UIAlertAction(title: "Accept", style: .default, handler: {(_) in
            self.addFriendToFirebase(email: user.email)
            print(user.email)
            self.deleteDocument(email: user.email)
        })
        
        //MARK: Sign In Action...
        let rejectAction = UIAlertAction(title: "Reject", style: .default, handler: {(_) in
            print(user.email)
            self.deleteDocument(email: user.email)
        })
        
        //MARK: action buttons...
        addFriendAlert.addAction(acceptAction)
        addFriendAlert.addAction(rejectAction)
        
        self.present(addFriendAlert, animated: true, completion: {() in
            //MARK: hide the alerton tap outside...
            addFriendAlert.view.superview?.isUserInteractionEnabled = true
            addFriendAlert.view.superview?.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(self.onTapOutsideAlert))
            )
        })

    }
    
    
}
