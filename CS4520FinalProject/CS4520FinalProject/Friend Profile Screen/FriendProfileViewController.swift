//
//  FriendProfileViewController.swift
//  CS4520FinalProject
//
//  Created by Liam Evans on 6/25/23.
//

import UIKit
import FirebaseFirestore

class FriendProfileViewController: UIViewController {
    
    let friendProfileView = FriendProfileView()
    
    var currentUser: User!
    
    var posts = [Post]()
    
    let database = Firestore.firestore()
    
    override func loadView() {
        view = friendProfileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        friendProfileView.tableViewPost.delegate = self
        friendProfileView.tableViewPost.dataSource = self
        
        friendProfileView.tableViewPost.separatorStyle = .none
        
        title = currentUser.name
        
        self.getAllPosts()
        
        if let url = currentUser.photo {
            friendProfileView.imageProfile.loadRemoteImage(from: url)
        } else {
            friendProfileView.imageProfile.image = Configs.defaultPicture
        }
        
        friendProfileView.labelName.text = currentUser.name
    }
    
}
