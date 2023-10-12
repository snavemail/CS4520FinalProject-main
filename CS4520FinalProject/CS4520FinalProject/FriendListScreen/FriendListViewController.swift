//
//  FriendListViewController.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/21/23.
//

import UIKit

class FriendListViewController: UIViewController {
    
    let friendListView = FriendListView()
    
    var friendList = [User]()
    
    var delegate: ViewController!

    override func loadView() {
        view = friendListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: patching table view delegate and data source...
        friendListView.tableViewFriends.delegate = self
        friendListView.tableViewFriends.dataSource = self
        
        //MARK: removing the separator line...
        friendListView.tableViewFriends.separatorStyle = .none
        
        self.getAllFriends()
        
        title = "Friends"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.backgroundColor = .lightGray
        
        let barFriendRequests = UIBarButtonItem(
            image: UIImage(systemName: "person.fill.questionmark"),
            style: .plain,
            target: self,
            action: #selector(onFriendRequestButtonTapped)
        )
        
        let barAddFriend = UIBarButtonItem(
            image: UIImage(systemName: "person.fill.badge.plus"),
            style: .plain,
            target: self,
            action: #selector(addNewFriendButtonAction)
        )
        
        navigationItem.rightBarButtonItems = [barAddFriend, barFriendRequests]
    }
    
    @objc func onFriendRequestButtonTapped() {
        let friendRequestViewController = FriendRequestViewController()
        friendRequestViewController.delegate = self.delegate
        navigationController?.pushViewController(friendRequestViewController, animated: true)
    }
    
    @objc func addNewFriendButtonAction() {
        let addFriendAlert = UIAlertController(
            title: "Find Friend",
            message: nil,
            preferredStyle: .alert)
        
        //MARK: setting up email textField in the alert...
        addFriendAlert.addTextField{ textField in
            textField.placeholder = "Friend's email"
            textField.contentMode = .center
            textField.keyboardType = .emailAddress
        }
        
        //MARK: Sign In Action...
        let addFriendAction = UIAlertAction(title: "Add Friend", style: .default, handler: {(_) in
            if let email = addFriendAlert.textFields![0].text {
                if email.isEmpty {
                    AlertController().alertMissingField(self)
                }
                else {
                    self.addFriendRequestToFirebase(email: email)
                }
            }
        })
        
        //MARK: Sign In Action...
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {(_) in
                
        })
        
        //MARK: action buttons...
        addFriendAlert.addAction(cancelAction)
        addFriendAlert.addAction(addFriendAction)
        
        self.present(addFriendAlert, animated: true, completion: {() in
            //MARK: hide the alerton tap outside...
            addFriendAlert.view.superview?.isUserInteractionEnabled = true
            addFriendAlert.view.superview?.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(self.onTapOutsideAlert))
            )
        })
    }
    
    @objc func onTapOutsideAlert(){
        self.dismiss(animated: true)
    }
}
