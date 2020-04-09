//
//  UserApi.swift
//  Chattest1
//
//  Created by admin prasthana on 09/04/20.
//  Copyright © 2020 prasthana. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
import ProgressHUD
 
class UserApi{
    func signUp(withUsername username: String, email: String, password: String, image: UIImage?, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void){
        
        Auth.auth().createUser(withEmail: email, password: password)
                                    {(authDataResult, error) in
                                     if error != nil{
                                         ProgressHUD.showError(error!.localizedDescription)
                                         return
                                     }
                                     if let authData = authDataResult{
                                         print (authData.user.email)
                                         var dict: Dictionary<String, Any> = [
                                             "uid" : authData.user.uid,
                                             "email" :authData.user.email,
                                             "username": username,
                                             "profileImageUrl" : "",
                                             "status" : "Welcome to chatapp"
                                         ]
                                        
                                        guard let imageSeclected = image else{
                                            ProgressHUD.showError("Please choose your profile image")
                                            return
                                        }
                                        guard let imageData = imageSeclected.jpegData(compressionQuality: 0.4) else{
                                            
                                            return
                                        }
                                        
                                         
                                         let storageRef = Storage.storage().reference(forURL: "gs://chatapp-51be6.appspot.com")
                                         let storageProfileRef = storageRef.child("profile").child(authData.user.uid)
                                         
                                         let metadata = StorageMetadata()
                                         metadata.contentType = "image/jpg"
                                         storageProfileRef.putData(imageData, metadata: metadata, completion: {
                                             (StorageMetadata, error) in
                                             if error != nil{
                                                 print(error?.localizedDescription)
                                                 return
                                             }
                                             
                                             storageProfileRef.downloadURL(completion: {
                                                 (URL, error) in
                                                 if let metaImageUrl = URL?.absoluteString {
                                                     dict["profileImageUrl"] = metaImageUrl
                                                     
                                                     Database.database().reference().child("users")
                                                     .child(authData.user.uid).updateChildValues(dict, withCompletionBlock: {
                                                         (error, ref) in
                                                         if error == nil{
                                                             
                                                            onSuccess()
                                                         } else {
                                                            onError(error!.localizedDescription)
                                                        }
                                                     })
                                                 }
                                             })
                                         })
                                         
                                         
                                     }
         }
    }
}
