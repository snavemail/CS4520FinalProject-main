//
//  RightBarButtonManager.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/20/23.
//

import UIKit
import FirebaseAuth

extension ViewController{
    func setupRightBarButton(isLoggedin: Bool){
        if isLoggedin{
            //MARK: user is logged in...
//            let barText = UIBarButtonItem(
//                title: "Logout",
//                style: .plain,
//                target: self,
//                action: #selector(onLogOutBarButtonTapped)
//            )
            
            let addFriend = UIBarButtonItem(image: UIImage(systemName: "person.2.fill"), style: .plain, target: self, action: #selector(addFriendButtonAction))
            
            
            if let url = self.currentAuthUser?.photoURL {
                self.mainScreenView.buttonProfile.loadRemoteImage(from: url)
            } else {
                self.mainScreenView.buttonProfile.setImage(Configs.defaultPicture, for: .normal)
            }
            
            mainScreenView.buttonProfile.addTarget(self, action: #selector(onProfileButtonAction), for: .touchUpInside)
            mainScreenView.buttonProfile.frame = CGRectMake(0, 0, 25, 25);
            let profile = UIBarButtonItem(customView: mainScreenView.buttonProfile)
            
            self.navigationItem.leftBarButtonItem = addFriend
            self.navigationItem.rightBarButtonItem = profile
            
        }else{
            //MARK: not logged in...
            let barText = UIBarButtonItem(
                title: "Sign in",
                style: .plain,
                target: self,
                action: #selector(onSignInBarButtonTapped)
            )
            self.navigationItem.rightBarButtonItems?.removeAll()
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.rightBarButtonItem = barText
        }
    }
    
    @objc func onProfileButtonAction() {
        let profileScreenController = ProfileViewController()
        profileScreenController.delegate = self
        navigationController?.pushViewController(profileScreenController, animated: true)
    }
    
    
    @objc func addFriendButtonAction() {
        let friendListViewController = FriendListViewController()
        friendListViewController.delegate = self
        navigationController?.pushViewController(friendListViewController, animated: true)
    }
    
    @objc func onSignInBarButtonTapped(){
        let signInAlert = UIAlertController(
            title: "Sign In / Register",
            message: "Please sign in to continue.",
            preferredStyle: .alert)
        
        //MARK: setting up email textField in the alert...
        signInAlert.addTextField{ textField in
            textField.placeholder = "Enter email"
            textField.contentMode = .center
            textField.keyboardType = .emailAddress
        }
        
        //MARK: setting up password textField in the alert...
        signInAlert.addTextField{ textField in
            textField.placeholder = "Enter password"
            textField.contentMode = .center
            textField.isSecureTextEntry = true
        }
        
        //MARK: Sign In Action...
        let signInAction = UIAlertAction(title: "Sign In", style: .default, handler: {(_) in
            if let email = signInAlert.textFields![0].text,
               let password = signInAlert.textFields![1].text{
                if email.isEmpty || password.isEmpty {
                    AlertController().alertMissingField(self)
                }
                else {
                    //MARK: sign-in logic for Firebase...
                    self.signInToFirebase(email: email, password: password)
                }
            }
        })
        
        //MARK: Register Action...
        let registerAction = UIAlertAction(title: "Register", style: .default, handler: {(_) in
            //MARK: logic to open the register screen...
            let registerViewController = RegisterViewController()
            registerViewController.delegate = self
            self.navigationController?.pushViewController(registerViewController, animated: true)
        })
        
        
        //MARK: action buttons...
        signInAlert.addAction(signInAction)
        signInAlert.addAction(registerAction)
        
        self.present(signInAlert, animated: true, completion: {() in
            //MARK: hide the alerton tap outside...
            signInAlert.view.superview?.isUserInteractionEnabled = true
            signInAlert.view.superview?.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(self.onTapOutsideAlert))
            )
        })
    }
    @objc func onTapOutsideAlert(){
        self.dismiss(animated: true)
    }
    
    func logoutCurrAuth(){
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?", preferredStyle: .actionSheet)
        logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: {(_) in
                do{
                    try Auth.auth().signOut()
                    self.posts.removeAll()
                    self.mainScreenView.postTableView.reloadData()
                    
                }catch{
                    print("Error occured!")
                }
            })
        )
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(logoutAlert, animated: true)
    }
    
    func signInToFirebase(email: String, password: String){
        //MARK: can you display progress indicator here?
        //MARK: authenticating the user...
        Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
            if error == nil{
                print("Logged in: \(email)")
            }else {
                let errorAlert = UIAlertController(
                    title: "Error",
                    message: "Check credentials again",
                    preferredStyle: .alert)
                
                //MARK: Sign In Action...
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: {(_) in
                    self.onSignInBarButtonTapped()
                })
                //MARK: action buttons...
                errorAlert.addAction(okAction)
                
                self.present(errorAlert, animated: true, completion: {() in
                    //MARK: hide the alerton tap outside...
                    errorAlert.view.superview?.isUserInteractionEnabled = true
                    errorAlert.view.superview?.addGestureRecognizer(
                        UITapGestureRecognizer(target: self, action: #selector(self.onTapOutsideAlert))
                    )
                })
            }
            
        })
    }
    
}

