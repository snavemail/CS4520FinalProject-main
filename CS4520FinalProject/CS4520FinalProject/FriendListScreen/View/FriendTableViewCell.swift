//
//  FriendTableViewCell.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/21/23.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelName : UILabel!
    var labelDate : UILabel!
    var labelMessage : UILabel!
    var imageProfile : UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        
        setupWrapperCellView()
        setupLabelDate()
        setupLabelName()
        setupLabelMessage()
        setupImageProfile()
        
        initConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.textAlignment = .left
        labelName.font = .boldSystemFont(ofSize: 10)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupLabelDate() {
        labelDate = UILabel()
        labelDate.textAlignment = .right
        labelDate.font = .boldSystemFont(ofSize: 10)
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelDate)
    }
    
    func setupLabelMessage() {
        labelMessage = UILabel()
        labelMessage.textAlignment = .left
        labelMessage.font = .boldSystemFont(ofSize: 14)
        labelMessage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelMessage)
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
    
    func initConstraint() {
        NSLayoutConstraint.activate(
            [
                wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
                wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                
                imageProfile.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
                imageProfile.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
                imageProfile.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, multiplier: 0.8),
                imageProfile.widthAnchor.constraint(equalTo: self.imageProfile.heightAnchor),
                
                labelName.topAnchor.constraint(equalTo: imageProfile.topAnchor),
                labelName.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 16),
                
                labelDate.topAnchor.constraint(equalTo: labelName.topAnchor),
                labelDate.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -16),
                
                labelMessage.topAnchor.constraint(equalTo: labelDate.bottomAnchor, constant: 8),
                labelMessage.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
                labelMessage.trailingAnchor.constraint(equalTo: labelDate.trailingAnchor),
                
                wrapperCellView.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
        
    }
}
