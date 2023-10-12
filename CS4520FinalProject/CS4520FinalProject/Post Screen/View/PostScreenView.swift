//
//  PostScreenView.swift
//  CS4520FinalProject
//
//  Created by jacob aberasturi on 6/24/23.
//

import UIKit

class PostScreenView: UIView {
    
    var textFieldDesc: UITextView!
    var buttonCreatePost: UIButton!
    var labelDesc: UILabel!
    var tableViewExerciseLogger: UITableView!
    
    var textFieldExercise: UITextField!
    var textFieldWeight: UITextField!
    var textFieldSets: UITextField!
    var textFieldReps: UITextField!
    
    var buttonAddExercise: UIButton!

    
    var buttonTakePhoto: UIButton!
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        setupTextFieldDesc()
        setupbuttonTakePhoto()
        setupButtonCreatePost()
        setupLabelDesc()
        setupTableViewExerciseLogger()
        
        setupTextFieldExercise()
        setupTextFieldWeight()
        setupTextFieldSets()
        setupTextFieldReps()
        
        setupButtonAddExercise()
        
        initConstraints()
    }
    
    func setupTextFieldDesc(){
        textFieldDesc = UITextView()
        textFieldDesc.isScrollEnabled = true
        textFieldDesc.isUserInteractionEnabled = true
        textFieldDesc.frame = CGRect(x: 10, y: 10, width:100, height: 100)
        textFieldDesc.keyboardType = .default
//        textFieldDesc.text = ""
        textFieldDesc.layer.borderWidth = 1
        textFieldDesc.layer.borderColor = UIColor.black.cgColor
        textFieldDesc.layer.cornerRadius = 5
        textFieldDesc.autocapitalizationType = .sentences
        textFieldDesc.font = .systemFont(ofSize: 14)
//        textFieldDesc.contentInsetAdjustmentBehavior = .automatic
//        textFieldDesc.setContentOffset(.zero, animated: true)
//        textFieldDesc.scrollRangeToVisible(NSRange(location:0, length:0))
        textFieldDesc.contentInset = UIEdgeInsets.init(top:-7.0,left:0.0,bottom:0.0,right:0.0)

        textFieldDesc.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldDesc)
    }
    
    func setupTableViewExerciseLogger() {
        tableViewExerciseLogger = UITableView()
        tableViewExerciseLogger.layer.borderWidth = 1
        tableViewExerciseLogger.layer.cornerRadius = 3
        tableViewExerciseLogger.register(ExerciseLoggerTableViewCell.self, forCellReuseIdentifier: Configs.tableViewExerciseLoggerID)
        tableViewExerciseLogger.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewExerciseLogger)
    }
    
    func setupTextFieldExercise() {
        textFieldExercise = UITextField()
        textFieldExercise.placeholder = "Exercise"
        textFieldExercise.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldExercise)
    }
    
    func setupTextFieldWeight() {
        textFieldWeight = UITextField()
        textFieldWeight.placeholder = "Weight"
        textFieldWeight.keyboardType = .numberPad
        textFieldWeight.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldWeight)
    }
    
    func setupTextFieldSets() {
        textFieldSets = UITextField()
        textFieldSets.placeholder = "Sets"
        textFieldSets.keyboardType = .numberPad
        textFieldSets.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldSets)
    }
    
    func setupTextFieldReps() {
        textFieldReps = UITextField()
        textFieldReps.placeholder = "Reps"
        textFieldReps.keyboardType = .numberPad
        textFieldReps.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldReps)
    }

    func setupButtonAddExercise() {
        buttonAddExercise = UIButton(type: .system)
        buttonAddExercise.setTitle("", for: .normal)
        buttonAddExercise.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        buttonAddExercise.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAddExercise)
    }

    func setupbuttonTakePhoto(){
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
//        buttonTakePhoto.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        buttonTakePhoto.contentMode = .scaleAspectFit
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
//        buttonTakePhoto.layer.cornerRadius = 0.5 * buttonTakePhoto.bounds.size.width
        buttonTakePhoto.clipsToBounds = true
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonTakePhoto)
    }
    
    func setupButtonCreatePost(){
        buttonCreatePost = UIButton(type: .system)
        buttonCreatePost.setTitle("Make Post", for: .normal)
        buttonCreatePost.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonCreatePost.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonCreatePost)
    }
    
    func setupLabelDesc(){
        labelDesc = UILabel()
        labelDesc.text = "Description:"
        labelDesc.font = .boldSystemFont(ofSize: 14)
        labelDesc.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelDesc)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
           
            buttonTakePhoto.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalTo: buttonTakePhoto.widthAnchor),
            
            tableViewExerciseLogger.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 16),
            tableViewExerciseLogger.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewExerciseLogger.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            tableViewExerciseLogger.heightAnchor.constraint(equalToConstant: 200),
            
            textFieldExercise.topAnchor.constraint(equalTo: tableViewExerciseLogger.bottomAnchor, constant: 4),
            textFieldExercise.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            textFieldExercise.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            
            textFieldWeight.centerYAnchor.constraint(equalTo: textFieldExercise.centerYAnchor),
            textFieldWeight.leadingAnchor.constraint(equalTo: textFieldExercise.trailingAnchor, constant: 4),
            textFieldWeight.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.15),
            
            textFieldSets.centerYAnchor.constraint(equalTo: textFieldWeight.centerYAnchor),
            textFieldSets.leadingAnchor.constraint(equalTo: textFieldWeight.trailingAnchor, constant: 4),
            textFieldSets.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.15),
            
            textFieldReps.centerYAnchor.constraint(equalTo: textFieldSets.centerYAnchor),
            textFieldReps.leadingAnchor.constraint(equalTo: textFieldSets.trailingAnchor, constant: 4),
            textFieldReps.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.15),

            
            buttonAddExercise.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonAddExercise.topAnchor.constraint(equalTo: textFieldExercise.bottomAnchor, constant: 8),

            
            labelDesc.topAnchor.constraint(equalTo: buttonAddExercise.bottomAnchor, constant: 16),
            labelDesc.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            
            textFieldDesc.topAnchor.constraint(equalTo: labelDesc.bottomAnchor, constant: 16),
            textFieldDesc.bottomAnchor.constraint(equalTo: textFieldDesc.topAnchor, constant: 64),
            textFieldDesc.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldDesc.widthAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.widthAnchor),
            textFieldDesc.leadingAnchor.constraint(equalTo: labelDesc.leadingAnchor),
            textFieldDesc.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            buttonCreatePost.topAnchor.constraint(equalTo: textFieldDesc.bottomAnchor, constant: 16),
            buttonCreatePost.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
