//
//  ResetPasswordViewController.swift
//  Chattest1
//
//  Created by puranam sreeram on 31/03/20.
//  Copyright © 2020 prasthana. All rights reserved.
//

import UIKit
import ProgressHUD


class ForgotPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var emailContainerView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

            setupResetUI()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetPasswordDidTapped(_ sender: Any) {
        guard let email = emailTextField.text, email != "" else{
            ProgressHUD.showError(ERROR_ENTER_RESET)
            return
        }
        Api.User.resetPassword(email: email, onSuccess: {
            self.view.endEditing(true)
            ProgressHUD.showSuccess(SUCCESS_EMAIL_RESET)
            self.navigationController?.popViewController(animated: true)
        }){ (errorMessage) in
            ProgressHUD.showError(errorMessage)
        
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
