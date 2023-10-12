//
//  FriendTableViewController.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/21/23.
//

import UIKit

extension FriendListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewFriendsID, for: indexPath) as! FriendTableViewCell
        
        // setup labels in cell
        let friend = friendList[indexPath.row]
        cell.labelName.text = friend.name
        cell.labelMessage.text = friend.email
        cell.labelDate.text = String(friend.age)
        
        if let url = friend.photo {
            cell.imageProfile.loadRemoteImage(from: url)
        } else {
            cell.imageProfile.image = Configs.defaultPicture
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(friendList[indexPath.row].email.lowercased())
        
        let friendProfileViewController = FriendProfileViewController()
        friendProfileViewController.currentUser = friendList[indexPath.row]
        navigationController?.pushViewController(friendProfileViewController, animated: true)
    }
    
    
}
