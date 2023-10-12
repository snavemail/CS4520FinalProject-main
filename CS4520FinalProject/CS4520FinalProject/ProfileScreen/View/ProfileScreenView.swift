//
//  ProfileScreenView.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/23/23.
//

import UIKit

class ProfileScreenView: UIView {

    var labelEmail: UILabel!
    var labelPhoto: UILabel!
    var buttonTakePhoto: UIButton!
    var buttonLogout: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelEmail()
        setuplabelPhoto()
        setupbuttonTakePhoto()
        setupButtonLogout()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabelEmail() {
        labelEmail = UILabel()
        labelEmail.font = UIFont.boldSystemFont(ofSize: 20)
        labelEmail.textColor = .black
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setuplabelPhoto(){
        labelPhoto = UILabel()
        labelPhoto.text = "Edit Profile Photo"
        labelPhoto.font = UIFont.boldSystemFont(ofSize: 14)
        labelPhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhoto)
    }
    
    func setupbuttonTakePhoto(){
        buttonTakePhoto = UIButton(type: .custom)
        buttonTakePhoto.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        buttonTakePhoto.contentMode = .scaleToFill
        buttonTakePhoto.layer.cornerRadius = 0.5 * buttonTakePhoto.bounds.size.width
        buttonTakePhoto.clipsToBounds = true
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonTakePhoto)
    }
    
    func setupButtonLogout() {
        buttonLogout = UIButton(type: .system)
        buttonLogout.setTitle("Logout", for: .normal)
        buttonLogout.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonLogout.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogout)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            labelEmail.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            labelEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            labelEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            
            buttonTakePhoto.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalTo: buttonTakePhoto.widthAnchor),
            
            labelPhoto.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 12),
            labelPhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonLogout.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttonLogout.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonLogout.widthAnchor.constraint(equalToConstant: 60),
            buttonLogout.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
}

