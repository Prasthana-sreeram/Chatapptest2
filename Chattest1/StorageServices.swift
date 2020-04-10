//
//  StorageServices.swift
//  Chattest1
//
//  Created by admin prasthana on 10/04/20.
//  Copyright © 2020 prasthana. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth
import ProgressHUD
class StorageServices{
    static func savePhoto(username: String, uid: String, data: Data, metadata: StorageMetadata, storageProfileRef: StorageReference, dict: Dictionary< String, Any>, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void){
        
        storageProfileRef.putData(data, metadata: metadata, completion: {
            (StorageMetadata, error) in
            if error != nil{
                onError(error!.localizedDescription)
                return
            }
            
            storageProfileRef.downloadURL(completion: {
                (URL, error) in
                if let metaImageUrl = URL?.absoluteString {
                    
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest(){
                        changeRequest.photoURL = URL
                        changeRequest.displayName = username
                        changeRequest.commitChanges(completion: {(error) in
                            if let error = error{
                                ProgressHUD.showError(error.localizedDescription)
                            }
                        })
                        
                    }
                    var dictTemp = dict
                    dictTemp[PROFILE_IMAGE_URL] = metaImageUrl
                    
                    Reference().databaseSpecificUser(uid: uid).updateChildValues(dictTemp, withCompletionBlock: {
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
