//
//  ExerciseLoggerTableViewCell.swift
//  CS4520FinalProject
//
//  Created by Liam Evans on 6/25/23.
//

import UIKit

class ExerciseLoggerTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelExercise: UILabel!
    var labelWeight: UILabel!
    var labelSets: UILabel!
    var labelReps: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        
        setupWrapperCellView()
        setupLabelExercise()
        setupLabelWeight()
        setupLabelSets()
        setupLabelReps()
        
        initConstraints()
    }
    
    func setupWrapperCellView() {
        wrapperCellView = UITableViewCell()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelExercise() {
        labelExercise = UILabel()
        labelExercise.font = .systemFont(ofSize: 16)
        labelExercise.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelExercise)
    }
    
    func setupLabelWeight() {
        labelWeight = UILabel()
        labelWeight.font = .systemFont(ofSize: 16)
        labelWeight.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelWeight)
    }
    
    func setupLabelSets() {
        labelSets = UILabel()
        labelSets.font = .systemFont(ofSize: 16)
        labelSets.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelSets)
    }
    
    func setupLabelReps() {
        labelReps = UILabel()
        labelReps.font = .systemFont(ofSize: 16)
        labelReps.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelReps)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate(
            [
                wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
                wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                
                labelExercise.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
                labelExercise.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
                labelExercise.widthAnchor.constraint(equalTo: wrapperCellView.widthAnchor, multiplier: 0.5),
                
                labelWeight.centerYAnchor.constraint(equalTo: labelExercise.centerYAnchor),
                labelWeight.leadingAnchor.constraint(equalTo: labelExercise.trailingAnchor, constant: 4 ),
                labelWeight.widthAnchor.constraint(equalTo: wrapperCellView.widthAnchor, multiplier: 0.15),
                
                labelSets.centerYAnchor.constraint(equalTo: labelWeight.centerYAnchor),
                labelSets.leadingAnchor.constraint(equalTo: labelWeight.trailingAnchor, constant: 4),
                labelSets.widthAnchor.constraint(equalTo: wrapperCellView.widthAnchor, multiplier: 0.15),
                
                labelReps.centerYAnchor.constraint(equalTo: labelSets.centerYAnchor),
                labelReps.leadingAnchor.constraint(equalTo: labelSets.trailingAnchor, constant: 4),
                labelReps.widthAnchor.constraint(equalTo: wrapperCellView.widthAnchor, multiplier: 0.15),
                
                wrapperCellView.heightAnchor.constraint(equalToConstant: 40),
                
            ]
        )
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
