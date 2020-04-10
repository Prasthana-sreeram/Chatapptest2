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
                                         let dict: Dictionary<String, Any> = [
                                             UID : authData.user.uid,
                                             EMAIL :authData.user.email,
                                             USERNAME: username,
                                             PROFILE_IMAGE_URL : "",
                                             STATUS : "Welcome to chatapp"
                                         ]
                                        
                                        guard let imageSeclected = image else{
                                            ProgressHUD.showError(ERROR_EMPTY_PHOTO)
                                            return
                                        }
                                        guard let imageData = imageSeclected.jpegData(compressionQuality: 0.4) else{
                                            
                                            return
                                        }
                                        
                                         
                                         
                                        let storageProfile = Reference().storageSprcificProfile(uid: authData.user.uid)
                                        
                                         let metadata = StorageMetadata()
                                         metadata.contentType = "image/jpg"
                                        
                                        StorageServices.savePhoto(username: username, uid: authData.user.uid, data: imageData, metadata: metadata, storageProfileRef: storageProfile, dict: dict, onSuccess: {
                                            onSuccess()
                                        }, onError: {(errorMessage) in
                                            onError(errorMessage)
                                        })
                                        
                                         
                                         
                                     }
         }
    }
}
