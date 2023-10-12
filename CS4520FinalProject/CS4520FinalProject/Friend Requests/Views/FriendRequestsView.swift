//
//  FriendRequestsView.swift
//  CS4520FinalProject
//
//  Created by Liam Evans on 6/23/23.
//

import UIKit

class FriendRequestsView: UIView {

    var tableViewFriendRequests: UITableView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupTableViewFriendRequests()
        
        initConstraints()
    }
    
    
    func setupTableViewFriendRequests() {
        tableViewFriendRequests = UITableView()
        tableViewFriendRequests.register(FriendRequestsTableViewCell.self, forCellReuseIdentifier: Configs.tableViewFriendRequestsID)
        tableViewFriendRequests.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewFriendRequests)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            tableViewFriendRequests.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableViewFriendRequests.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            tableViewFriendRequests.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tableViewFriendRequests.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewFriendRequests.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
