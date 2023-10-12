//
//  FriendProfileView.swift
//  CS4520FinalProject
//
//  Created by Liam Evans on 6/25/23.
//

import UIKit

class FriendProfileView: UIView {

    var imageProfile: UIImageView!
    var labelName: UILabel!
    var tableViewPost: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupImageProfile()
        setupLabelName()
        setupTableViewPost()
        
        initConstraints()
    }
    
    func setupImageProfile() {
        imageProfile = UIImageView()
        imageProfile.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageProfile.contentMode = .scaleToFill
        imageProfile.layer.cornerRadius = 0.5 * imageProfile.bounds.size.width
        imageProfile.clipsToBounds = true
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageProfile)
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.textAlignment = .left
        labelName.font = .boldSystemFont(ofSize: 30)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupTableViewPost() {
        tableViewPost = UITableView()
        tableViewPost.register(FriendProfileTableViewCell.self, forCellReuseIdentifier: Configs.tableViewProfileFriendsID)
        tableViewPost.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewPost)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            imageProfile.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            imageProfile.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            imageProfile.widthAnchor.constraint(equalToConstant: 50),
            imageProfile.heightAnchor.constraint(equalTo: imageProfile.widthAnchor),
            
            labelName.centerYAnchor.constraint(equalTo: imageProfile.centerYAnchor),
            labelName.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 16),
            
            tableViewPost.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 16),
            tableViewPost.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            tableViewPost.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tableViewPost.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewPost.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
