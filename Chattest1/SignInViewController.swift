//
//  SignInViewController.swift
//  Chattest1
//
//  Created by puranam sreeram on 31/03/20.
//  Copyright © 2020 prasthana. All rights reserved.
//

import UIKit
import ProgressHUD

class SignInViewController: UIViewController {
    
    @IBOutlet weak var titleLabelText: UILabel!
    
    @IBOutlet weak var emailContainerView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordContainerView: UIView!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSignInUI()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signInButtonDidTapped(_ sender: Any) {
        
        self.view.endEditing(true)
                self.validateFields()
                self.signIn(onSuccess: {
        //            on switch view
                    
                }) {(errorMessage) in
                    ProgressHUD.showError(errorMessage)
                }
                
    }
    
    
}
