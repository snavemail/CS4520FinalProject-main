//
//  PostScreen.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/23/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import PhotosUI

extension PostScreenViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(
                    ofClass: UIImage.self,
                    completionHandler: { (image, error) in
                        DispatchQueue.main.async{
                            if let uwImage = image as? UIImage{
                                self.postView.buttonTakePhoto.setImage(
                                    uwImage.withRenderingMode(.alwaysOriginal),
                                    for: .normal
                                )
                                self.pickedImage = uwImage
                            }
                        }
                    }
                )
            }
        }
    }
}

//MARK: adopting required protocols for UIImagePicker...
extension PostScreenViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.postView.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded...
        }
    }
}

extension PostScreenViewController {
    func uploadProfilePhotoToStorage(){
            var profilePhotoURL:URL?
            
            //MARK: Upload the profile photo if there is any...
            if let image = pickedImage{
                if let jpegData = image.jpegData(compressionQuality: 80){
                    let storageRef = storage.reference()
                    let imagesRepo = storageRef.child("imagesUsers")
                    let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                    
                    _ = imageRef.putData(jpegData, completion: {(metadata, error) in
                        if error == nil{
                            imageRef.downloadURL(completion: {(url, error) in
                                if error == nil{
                                    profilePhotoURL = url
                                    self.createPost(photoURL: profilePhotoURL!)
                                }
                            })
                        }
                    })
                }
            }else{
                alertMissingImage()
            }
        }
    
}

func alertMissingImage() {
    let alert = UIAlertController(title: "Image is not valid", message: nil, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
    }))
    
}
