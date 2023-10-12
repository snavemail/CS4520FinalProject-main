//
//  FriendListView.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/21/23.
//

import UIKit

class FriendListView: UIView {

    var tableViewFriends: UITableView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupTableViewFriends()
        
        initConstraints()
    }
    

    func setupTableViewFriends() {
        tableViewFriends = UITableView()
        tableViewFriends.register(FriendTableViewCell.self, forCellReuseIdentifier: Configs.tableViewFriendsID)
        tableViewFriends.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewFriends)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            tableViewFriends.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableViewFriends.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            tableViewFriends.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tableViewFriends.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewFriends.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
