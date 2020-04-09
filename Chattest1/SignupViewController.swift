//
//  SignupViewController.swift
//  Chattest1
//
//  Created by puranam sreeram on 30/03/20.
//  Copyright © 2020 prasthana. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class SignupViewController: UIViewController {

    @IBOutlet weak var titleTextLabel: UILabel!
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var fullnameContainerView: UIView!
    
    @IBOutlet weak var fullnameTextField: UITextField!
    
    @IBOutlet weak var emailContainerView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordContainerView: UIView!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var signInButton: UIButton!
    
    var image: UIImage? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupsignUpUI()

        // Do any additional setup after loading the view.
    }
    
    func setupsignUpUI(){
        
        setupTitleLabel()
        setupmainImageview()
        setupfullnameTextiField()
        setupemailTextField()
        setuppasswordTextField()
        setupsignUpButton()
        setupsignInButton()
        
    }
    
    
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func signupButtonDidTapped(_ sender: Any) {
        
        guard let imageSeclected = self.image else{
            print("mainImage is nil")
            return
        }
        guard let imageData = imageSeclected.jpegData(compressionQuality: 0.4) else{
            
            return
        }
        Auth.auth().createUser(withEmail: "testmail11@gmail.com", password: "12345678")
                               {(AuthDataResult, Error) in
                                if Error != nil{
                                    print(Error!.localizedDescription)
                                    return
                                }
                                if let authData = AuthDataResult{
                                    print (authData.user.email)
                                    var dict: Dictionary<String, Any> = [
                                        "uid" : authData.user.uid,
                                        "email" :authData.user.email,
                                        "profileImageUrl" : "",
                                        "status" : "Welcome to chatapp"
                                    ]
                                    
                                    let storageRef = Storage.storage().reference(forURL: "gs://chatapp-51be6.appspot.com")
                                    let storageProfileRef = storageRef.child("profile").child(authData.user.uid)
                                    
                                    let metadata = StorageMetadata()
                                    metadata.contentType = "image/jpg"
                                    storageProfileRef.putData(imageData, metadata: metadata, completion: {
                                        (StorageMetadata, Error) in
                                        if Error != nil{
                                            print(Error?.localizedDescription)
                                            return
                                        }
                                        
                                        storageProfileRef.downloadURL(completion: {
                                            (URL, Error) in
                                            if let metaImageUrl = URL?.absoluteString {
                                                dict["profileImageUrl"] = metaImageUrl
                                                
                                                Database.database().reference().child("users")
                                                .child(authData.user.uid).updateChildValues(dict, withCompletionBlock: {
                                                    (Error, ref) in
                                                    if Error == nil{
                                                        print("Done")
                                                    }
                                                })
                                            }
                                        })
                                    })
                                    
                                    
                                }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
