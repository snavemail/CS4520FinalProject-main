//
//  ViewController.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/20/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class ViewController: UIViewController {

    let mainScreenView = MainScreenView()
    
    var currentAuthUser: FirebaseAuth.User?
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    var currentUser: User!
    
    let database = Firestore.firestore()
    
    var posts = [Post]()
    
    override func loadView() {
        view = mainScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FitLink"
        
       // mainScreenView.bringSubviewToFront(mainScreenView.buttonProfile)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.backgroundColor = .lightGray
        
        mainScreenView.postButton.addTarget(self, action: #selector(onButtonPostTapped), for: .touchUpInside)
        
        mainScreenView.postTableView.delegate = self
        mainScreenView.postTableView.dataSource = self
        
        //MARK: removing the separator line...
        mainScreenView.postTableView.separatorStyle = .none
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                self.currentAuthUser = nil
                self.currentUser = nil
                
                self.mainScreenView.labelText.text = "Please sign in to see the messages!"

                //MARK: Sign in bar button...
                self.setupRightBarButton(isLoggedin: false)
                
            }else{
                //MARK: the user is signed in...
                self.currentAuthUser = user
                self.getUserDetail(email: (self.currentAuthUser?.email)!)
                
                self.mainScreenView.labelText.text = "Welcome \(user?.displayName ?? "Anonymous")!"

                //MARK: Logout bar button...
                self.setupRightBarButton(isLoggedin: true)
                self.getAllPosts()
                
            }
        }
    }
    
    @objc func onButtonPostTapped(){
        let postScreen = PostScreenViewController()
        postScreen.delegate = self
        navigationController?.pushViewController(postScreen, animated: true)
    }

}

