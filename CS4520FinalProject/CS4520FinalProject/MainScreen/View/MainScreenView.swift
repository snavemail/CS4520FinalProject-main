//
//  MainScreenView.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/20/23.
//

import UIKit

class MainScreenView: UIView {
    
    var postTableView : UITableView!
    var labelText : UILabel!
    var postButton : UIButton!
    var bottomAddView: UIView!

    
    var buttonProfile : UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupPostTableView()
        setupLabelText()
        setupButtonProfile()
        setupBottomAddView()
        setupButtonTakePhoto()
        initConstraints()
    }
    
    func setupPostTableView() {
        postTableView = UITableView()
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: Configs.tableViewPostId)
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(postTableView)
    }
    
    func setupBottomAddView(){
        bottomAddView = UIView()
        bottomAddView.backgroundColor = .white
        bottomAddView.layer.cornerRadius = 6
        bottomAddView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomAddView.layer.shadowOffset = .zero
        bottomAddView.layer.shadowRadius = 4.0
        bottomAddView.layer.shadowOpacity = 0.7
        bottomAddView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomAddView)
    }
    
    func setupButtonTakePhoto(){
        postButton = UIButton(type: .system)
        postButton.setTitle("", for: .normal)
        postButton.setImage(UIImage(systemName: "camera.shutter.button.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        //buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        postButton.contentHorizontalAlignment = .fill
        postButton.contentVerticalAlignment = .fill
        postButton.imageView?.contentMode = .scaleAspectFill
        postButton.showsMenuAsPrimaryAction = true
        postButton.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(postButton)
        
    }
    
    func setupLabelText() {
        labelText = UILabel()
        labelText.font = .boldSystemFont(ofSize: 14)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelText)
    }
    
    func setupButtonProfile() {
        buttonProfile = UIButton(type: .custom)
        buttonProfile.contentMode = .scaleToFill
        buttonProfile.contentHorizontalAlignment = .fill
        buttonProfile.contentVerticalAlignment = .fill
        buttonProfile.layer.cornerRadius = 0.5 * buttonProfile.bounds.size.width
        buttonProfile.clipsToBounds = true
        buttonProfile.showsMenuAsPrimaryAction = true
        buttonProfile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonProfile)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            bottomAddView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            bottomAddView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            
            postButton.bottomAnchor.constraint(equalTo: bottomAddView.bottomAnchor, constant: -8),
//            buttonSend.leadingAnchor.constraint(equalTo: bottomAddView.leadingAnchor, constant: 2),
            postButton.centerXAnchor.constraint(equalTo: bottomAddView.centerXAnchor),
            postButton.heightAnchor.constraint(equalToConstant: 50),
            postButton.widthAnchor.constraint(equalToConstant: 50),
            
            bottomAddView.topAnchor.constraint(equalTo: postButton.topAnchor, constant: -8),
            bottomAddView.leadingAnchor.constraint(equalTo: postButton.leadingAnchor, constant: -8),
            bottomAddView.trailingAnchor.constraint(equalTo: postButton.trailingAnchor, constant: 8),
            
            labelText.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            labelText.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelText.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
//            buttonProfile.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
//            buttonProfile.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            buttonProfile.heightAnchor.constraint(equalToConstant: 30),
            buttonProfile.widthAnchor.constraint(equalToConstant: 30),
            
            postTableView.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 16),
            postTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            postTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            postTableView.bottomAnchor.constraint(equalTo: bottomAddView.topAnchor, constant: -8),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

