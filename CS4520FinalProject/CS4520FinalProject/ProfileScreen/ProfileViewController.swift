//
//  ProfileViewController.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/23/23.
//

import UIKit
import FirebaseStorage
import PhotosUI

class ProfileViewController: UIViewController {

    let profileScreenView = ProfileScreenView()
    
    var delegate : ViewController!
    
    var pickedImage: UIImage?
    
    let storage = Storage.storage()
    
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = profileScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = delegate.currentUser.name
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(onEditButtonAction))
        
        profileScreenView.buttonTakePhoto.menu = getMenuImagePicker()
        
        profileScreenView.buttonLogout.addTarget(self, action: #selector(self.onLogoutButtonAction), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        
        if let url = self.delegate.currentAuthUser?.photoURL {
            self.profileScreenView.buttonTakePhoto.loadRemoteImage(from: url)
            self.pickedImage = self.delegate.mainScreenView.buttonProfile.currentImage
        } else {
            self.profileScreenView.buttonTakePhoto.setImage(Configs.defaultPicture, for: .normal)
        }
        self.profileScreenView.labelEmail.text = "Email: \(delegate.currentAuthUser?.email ?? "Anonymous User")"
    
        self.isEditMode(edit: false)
    }
    
    func isEditMode(edit: Bool) {
        self.profileScreenView.labelPhoto.isHidden = customXor(true, edit)
        self.profileScreenView.buttonTakePhoto.showsMenuAsPrimaryAction = customXor(false, edit)
        self.profileScreenView.buttonLogout.isHidden = customXor(false, edit)
        
        func customXor(_ left: Bool, _ right: Bool) -> Bool{
            return left != right
        }
    }
    
    @objc func onEditButtonAction() {
        self.isEditMode(edit: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(onSaveButtonAction))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onCancelButtonAction))
    }
    
    @objc func onCancelButtonAction() {
        self.isEditMode(edit: false)
        
        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(onEditButtonAction))
        navigationItem.backBarButtonItem?.isHidden = false
    }
    
    @objc func onSaveButtonAction() {
        self.showActivityIndicator()
        self.uploadProfilePhotoToStorage()
    }
    
    @objc func onLogoutButtonAction() {
        navigationController?.popViewController(animated: true)
        self.delegate.logoutCurrAuth()
    }
    
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        //MARK: Photo from Gallery...
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
}

