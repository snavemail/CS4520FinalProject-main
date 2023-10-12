//
//  FriendProfileTableViewCell.swift
//  CS4520FinalProject
//
//  Created by jacob aberasturi on 6/23/23.
//

import UIKit

class FriendProfileTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    var imageProfile: UIImageView!
    var labelName : UILabel!
    
    var labelExercises: UILabel!
    var labelWeights: UILabel!
    var labelSets: UILabel!
    var labelReps: UILabel!
    
    var labelDescription : UILabel!
    var imagePost : UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        
        
        setupWrapperCellView()
        setupImageProfile()
        setupLabelExercises()
        setupLabelWeights()
        setupLabelSets()
        setupLabelReps()
        setupLabelDescription()
        setupLabelName()
        setupImagePost()
        
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
        labelName.font = .boldSystemFont(ofSize: 19)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupImagePost() {
        imagePost = UIImageView()
        imagePost.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imagePost.contentMode = .scaleToFill
        imagePost.layer.cornerRadius = 0.5 * imagePost.bounds.size.width
        imagePost.clipsToBounds = true
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imagePost)
    }
    
    func setupLabelExercises() {
        labelExercises = UILabel()
        labelExercises.text = ""
        labelExercises.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelExercises)
    }
    
    func setupLabelWeights() {
        labelWeights = UILabel()
        labelWeights.text = ""
        labelWeights.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelWeights)
    }
    
    func setupLabelSets() {
        labelSets = UILabel()
        labelSets.text = ""
        labelSets.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelSets)
    }
    
    func setupLabelReps() {
        labelReps = UILabel()
        labelReps.text = ""
        labelReps.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelReps)
    }
    
    func setupLabelDescription() {
        labelDescription = UILabel()
        labelDescription.textAlignment = .right
        labelDescription.font = .systemFont(ofSize: 16)
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDescription)
    }

    
    func initConstraint() {
        NSLayoutConstraint.activate(
            [
                wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
                wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                
                imageProfile.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
                imageProfile.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
                imageProfile.widthAnchor.constraint(equalToConstant: 25),
                imageProfile.heightAnchor.constraint(equalTo: imageProfile.widthAnchor),
                
                labelName.centerYAnchor.constraint(equalTo: imageProfile.centerYAnchor),
                labelName.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 8),
                
                imagePost.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
                imagePost.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor),
                imagePost.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
                imagePost.widthAnchor.constraint(equalTo: wrapperCellView.widthAnchor),
                imagePost.heightAnchor.constraint(equalTo: imagePost.widthAnchor),
                
                labelExercises.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 12),
                labelExercises.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 4),
                labelExercises.widthAnchor.constraint(equalTo: wrapperCellView.widthAnchor, multiplier: 0.5),
                
                labelWeights.centerYAnchor.constraint(equalTo: labelExercises.centerYAnchor),
                labelWeights.leadingAnchor.constraint(equalTo: labelExercises.trailingAnchor, constant: 4),
                labelWeights.widthAnchor.constraint(equalTo: wrapperCellView.widthAnchor, multiplier: 0.15),
                
                labelSets.centerYAnchor.constraint(equalTo: labelWeights.centerYAnchor),
                labelSets.leadingAnchor.constraint(equalTo: labelWeights.trailingAnchor, constant: 4),
                labelSets.widthAnchor.constraint(equalTo: wrapperCellView.widthAnchor, multiplier: 0.15),
                
                labelReps.centerYAnchor.constraint(equalTo: labelSets.centerYAnchor),
                labelReps.leadingAnchor.constraint(equalTo: labelSets.trailingAnchor, constant: 4),
                labelReps.widthAnchor.constraint(equalTo: wrapperCellView.widthAnchor, multiplier: 0.15),
                
                labelDescription.topAnchor.constraint(equalTo: labelReps.bottomAnchor),
                labelDescription.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
                labelDescription.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -8),
                
            ]
        )
        
    }
}
