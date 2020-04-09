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
import ProgressHUD

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
        self.view.endEditing(true)
        self.validateFields()
        self.signUp()
        
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


