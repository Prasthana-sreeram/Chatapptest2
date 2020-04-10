//
//  Reference.swift
//  Chattest1
//
//  Created by admin prasthana on 10/04/20.
//  Copyright © 2020 prasthana. All rights reserved.
//

import Foundation
import Firebase

let REF_USER = "Users"
let URL_STORAGE_ROOT = "gs://chatapp-51be6.appspot.com"
let STORAGE_PROFILE = "profile"
let PROFILE_IMAGE_URL = "profileImageUrl"
let UID = "uid"
let EMAIL = "email"
let USERNAME = "username"
let STATUS = "status"
let ERROR_EMPTY_PHOTO = "Please choose your profile image"
let ERROR_EMPTY_EMAIL = "Please enter an email address"
let ERROR_EMPTY_USERNAME = "Please enter an username"
let ERROR_EMPTY_PASSWORD = "Please enter a password"


class Reference{
    let databaseRoot: DatabaseReference = Database.database().reference()
    
    var databaseUser: DatabaseReference{
        return databaseRoot.child(REF_USER)
    }
    
    func databaseSpecificUser(uid: String) -> DatabaseReference{
        return databaseUser.child(uid)
    }
    
    
//    storage Reference
    
    let storageRoot = Storage.storage().reference(forURL: URL_STORAGE_ROOT)
    
    var storageProfile : StorageReference{
        return storageRoot.child(STORAGE_PROFILE)
    }
    func storageSprcificProfile(uid: String) -> StorageReference {
        return storageProfile.child(uid)
    }
}
