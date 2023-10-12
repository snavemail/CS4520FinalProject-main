//
//  FirebaseAPICalls.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/21/23.
//

import Foundation
import FirebaseAuth
import UIKit

extension FriendListViewController {
    
    func getAllFriends() {
        //MARK: Observe Firestore database to display the friends list...
        self.delegate.database.collection("user").document((delegate.currentAuthUser?.email)!).collection("friend")
            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                if let documents = querySnapshot?.documents{
                    self.friendList.removeAll()
                    for document in documents{
                        do{
                            let friend = try document.data(as: User.self)
                            self.friendList.append(friend)
                            
                        } catch {
                            print(error)
                        }
                    }
                    // print(self.friendList)
                    self.friendListView.tableViewFriends.reloadData()
                    print(self.friendList.count)
                }
                // self.hideActivityIndicator()
            })
    }
    

    
    func addFriendRequestToFirebase(email: String) {
        let collectionFriend = self.delegate.database
            .collection("user").document(email.lowercased()).collection("friendRequests").document((delegate.currentAuthUser?.email)!)
        
        self.delegate.database.collection("user").addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
            if let documents = querySnapshot?.documents{
                for document in documents{
                    do{
                        let user = try document.data(as: User.self)
                        
                        if user.email.lowercased() == self.delegate.currentUser.email.lowercased() {
                            collectionFriend.setData(["name": user.name,
                                                                "email": user.email,
                                                                "age": user.age,
                                                                "photo": user.photo?.absoluteString])
                        }
                        
                        
                    } catch {
                        print(error)
                    }
                }
            }
        })
    }
    
}

extension ViewController {
    func getUserDetail(email: String) {
        self.database.collection("user").addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
            if let documents = querySnapshot?.documents{
                for document in documents{
                    do{
                        let user = try document.data(as: User.self)
                        
                        if user.email.lowercased() == email.lowercased() {
                            self.currentUser = user
                        }
                        
                    } catch {
                        print(error)
                    }
                }
            }
        })
    }
    
    func getAllPosts() {
        self.database.collection("user").document((self.currentAuthUser?.email)!).collection("post")
            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                if let documents = querySnapshot?.documents{
                    self.posts.removeAll()
                    for document in documents{
                        do{
                            let post = try document.data(as: Post.self)
                            self.posts.append(post)
                            
                        } catch {
                            print(error)
                        }
                    }
                    // print(self.friendList)
                    self.mainScreenView.postTableView.reloadData()
                    print("\(self.posts.count) Posts" )
                }
            })
    }
}


extension RegisterViewController{
    
    func registerNewAccount(photoURL: URL?){
        //MARK: display the progress indicator...
        showActivityIndicator()
        //MARK: create a Firebase user with email and password...
        if let name = registerView.textFieldName.text,
           let email = registerView.textFieldEmail.text,
           let age = registerView.textFieldAge.text,
           let password = registerView.textFieldPassword.text {
            
            let newUser = User(name: name, email: email, age: Int(age)!, photo: photoURL)
            //Validations....
            Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                if error == nil{
                    //MARK: the user creation is successful...
                    self.setNameOfTheUserInFirebaseAuth(name: name, photoURL: photoURL)
                    self.addNewUserInFirebase(newUser: newUser)
                }
                else {
                    AlertController().alertCustom(text: "Email already exists", self)
                    self.hideActivityIndicator()
                }
            })
        }
    }
    
    //MARK: We set the name of the user after we create the account...
    func setNameOfTheUserInFirebaseAuth(name: String, photoURL: URL?){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.photoURL = photoURL
        
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                //MARK: the profile update is successful...
                
                //MARK: hide the progress indicator...
                self.hideActivityIndicator()
                
                //MARK: pop the current controller...
                self.navigationController?.popViewController(animated: true)
            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }
    
    func addNewUserInFirebase(newUser: User) {
        let collectionUsers = self.database
            .collection("user").document(newUser.email.lowercased())
        
        collectionUsers.setData(["name": newUser.name,
                                 "email": newUser.email,
                                 "age": newUser.age,
                                 "photo" : newUser.photo?.absoluteString])

    }
}

extension PostScreenViewController {
    
    func createPost(photoURL: URL?) {
        if let caption = postView.textFieldDesc.text
        {
            print("Posting")
            let post = Post(caption: caption, image: photoURL, workout: self.exercises)
            do {
                let collectionPost = try self.database
                    .collection("user").document((delegate.currentAuthUser?.email)!).collection("post").addDocument(from: post, completion: {(error) in
                        if error == nil{
                            //MARK: hide progress indicator...
                            self.navigationController?.popViewController(animated: true)
                        }
                        else {
                            print("Error occured: \(String(describing: error))")
                        }
                    })
            }
            catch {
                print("Error occured")
            }
        }
        // do post create here
        
    }
}
           
extension FriendRequestViewController {
    func addFriendToFirebase(email: String) {
        let collectionFriend = self.delegate.database
            .collection("user").document(email.lowercased()).collection("friend")
        
        self.delegate.database.collection("user").addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
            if let documents = querySnapshot?.documents{
                for document in documents{
                    do{
                        let user = try document.data(as: User.self)
                        
                        if user.email.lowercased() == self.delegate.currentUser.email.lowercased() {
                            collectionFriend.addDocument(data: ["name": user.name,
                                                                "email": user.email,
                                                                "age": user.age,
                                                                "photo": user.photo?.absoluteString])
                        }
                        
                        
                    } catch {
                        print(error)
                    }
                }
            }
        })
        
        let collectionOtherFriend = self.delegate.database
            .collection("user").document((delegate.currentAuthUser?.email)!).collection("friend")
        
        self.delegate.database.collection("user").addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
            if let documents = querySnapshot?.documents{
                for document in documents{
                    do{
                        let user = try document.data(as: User.self)
                        
                        if user.email.lowercased() == email.lowercased() {
                            collectionOtherFriend.addDocument(data: ["name": user.name,
                                                                "email": user.email,
                                                                "age": user.age,
                                                                "photo": user.photo?.absoluteString])
                        }
                        
                    } catch {
                        print(error)
                    }
                }
            }
        })
    }
    
    func deleteDocument(email: String) {
        self.database.collection("user").document((delegate.currentAuthUser?.email)!).collection("friendRequests").document(email.lowercased()).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    
    func getAllFriendRequests() {
        //MARK: Observe Firestore database to display the friends list...
        self.delegate.database.collection("user").document((delegate.currentAuthUser?.email)!).collection("friendRequests")
            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                if let documents = querySnapshot?.documents{
                    self.friendRequestList.removeAll()
                    for document in documents{
                        do{
                            let friend = try document.data(as: User.self)
                            self.friendRequestList.append(friend)
                            
                        } catch {
                            print(error)
                        }
                    }
                    // print(self.friendList)
                    self.friendRequestView.tableViewFriendRequests.reloadData()
                    print(self.friendRequestList.count)
                }
            })
    }
}

extension FriendProfileViewController {
    func getAllPosts() {
        self.database.collection("user").document(self.currentUser.email.lowercased()).collection("post")
            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                if let documents = querySnapshot?.documents{
                    self.posts.removeAll()
                    for document in documents{
                        do{
                            let post = try document.data(as: Post.self)
                            self.posts.append(post)
                            
                        } catch {
                            print(error)
                        }
                    }
                    // print(self.friendList)
                    self.friendProfileView.tableViewPost.reloadData()
                    print("\(self.posts.count) Posts" )
                }
            })
    }
}

extension ProfileViewController {
    //MARK: We set the name of the user after we create the account...
    func updateProfilePicture(photoURL: URL?){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.photoURL = photoURL
        
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                //MARK: the profile update is successful...
                
                //MARK: hide the progress indicator...
                self.hideActivityIndicator()
                self.onCancelButtonAction()
            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }
}
