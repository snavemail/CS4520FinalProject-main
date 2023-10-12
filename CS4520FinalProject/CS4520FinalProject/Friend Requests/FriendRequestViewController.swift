//
//  FriendRequestViewController.swift
//  CS4520FinalProject
//
//  Created by Liam Evans on 6/23/23.
//

import UIKit
import FirebaseFirestore

class FriendRequestViewController: UIViewController {
    
    let friendRequestView = FriendRequestsView()
    
    var friendRequestList = [User]()
    
    var delegate: ViewController!
    
    let database = Firestore.firestore()

    override func loadView() {
        view = friendRequestView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: patching table view delegate and data source...
        friendRequestView.tableViewFriendRequests.delegate = self
        friendRequestView.tableViewFriendRequests.dataSource = self
        
        //MARK: removing the separator line...
        friendRequestView.tableViewFriendRequests.separatorStyle = .none
        
        self.getAllFriendRequests()
        
        title = "Friend Requests"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .lightGray
        
    }

    
    @objc func onTapOutsideAlert(){
        self.dismiss(animated: true)
    }



    

}
