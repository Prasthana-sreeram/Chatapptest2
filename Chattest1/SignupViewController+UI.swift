//
//  SignupViewController+UI.swift
//  Chattest1
//
//  Created by puranam sreeram on 31/03/20.
//  Copyright © 2020 prasthana. All rights reserved.
//

import UIKit
import ProgressHUD

extension SignupViewController{
    
    
    
    func  setupTitleLabel(){
        let title = "Sign Up"
        
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.init(name: "DIDot", size: 28)!, NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        
               titleTextLabel.attributedText = attributedText
        
    }
    func setupmainImageview(){
        mainImageView.layer.cornerRadius = 40
        mainImageView.clipsToBounds = true
        mainImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        mainImageView.addGestureRecognizer(tapGesture)
    }
    @objc func presentPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        self.present(picker,animated: true,completion: nil)
    }
    
    func setupfullnameTextiField(){
        
        fullnameContainerView.layer.borderWidth = 1
        fullnameContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        fullnameContainerView.layer.cornerRadius = 3
        fullnameContainerView.clipsToBounds = true
        
        fullnameTextField.borderStyle = .none
        
        let placeholderAttr = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        
        fullnameTextField.attributedPlaceholder = placeholderAttr
        fullnameTextField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        
    }
    func setupemailTextField(){
        emailContainerView.layer.borderWidth = 1
        emailContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        emailContainerView.layer.cornerRadius = 3
        emailContainerView.clipsToBounds = true
        
        emailTextField.borderStyle = .none
        
        let placeholderAttr = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        
        emailTextField.attributedPlaceholder = placeholderAttr
        emailTextField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        
    }
    func setuppasswordTextField(){
        
        passwordContainerView.layer.borderWidth = 1
        passwordContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        passwordContainerView.layer.cornerRadius = 3
        passwordContainerView.clipsToBounds = true
        
        passwordTextField.borderStyle = .none
        
        let placeholderAttr = NSAttributedString(string: "Password (10= characters)", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        
        passwordTextField.attributedPlaceholder = placeholderAttr
        passwordTextField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        
    }
    func setupsignUpButton(){
        signUpButton.setTitle("Sign Up", for: UIControl.State.normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signUpButton.backgroundColor = UIColor.black
        signUpButton.layer.cornerRadius = 5
        signUpButton.clipsToBounds = true
        signUpButton.setTitleColor(.white, for: UIControl.State.normal)
        
    }
    func setupsignInButton(){
        let attributtedText = NSMutableAttributedString(string: "Already have an account?   ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),NSAttributedString.Key.foregroundColor: UIColor.systemGray])
               
               let attributtedsignInText = NSMutableAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),NSAttributedString.Key.foregroundColor: UIColor.black])
               attributtedText.append(attributtedsignInText)
        signInButton.setAttributedTitle(attributtedText, for: UIControl.State.normal)
               
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func validateFields(){
           guard let username = self.fullnameTextField.text, !username.isEmpty else{
               ProgressHUD.showError(ERROR_EMPTY_USERNAME)
               return
           }
           guard let email = self.emailTextField.text, !email.isEmpty else{
                      
               ProgressHUD.showError(ERROR_EMPTY_EMAIL)
                      return
                  }
           guard let password = self.passwordTextField.text, !password.isEmpty else{
           
               ProgressHUD.showError(ERROR_EMPTY_PASSWORD)
                      return
                  }
       }
    
    func signUp(onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void){
       
        ProgressHUD.show()
     
        Api.User.signUp(withUsername: self.fullnameTextField.text!, email: self.emailTextField.text!, password: self.passwordTextField.text!, image: self.image, onSuccess: {
            ProgressHUD.dismiss()
            onSuccess()
        }) { (errorMessage) in
            onError(errorMessage)
            
        }
    }
}

extension SignupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSeclected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            image = imageSeclected
            mainImageView.image = imageSeclected
        }
        if let imageOriginal = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            image = imageOriginal
            mainImageView.image = imageOriginal
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
}
        // Do any additional setup after loading the view.
    
