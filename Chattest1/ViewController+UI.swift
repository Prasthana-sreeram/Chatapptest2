//
//  ViewController+UI.swift
//  Chattest1
//
//  Created by puranam sreeram on 30/03/20.
//  Copyright © 2020 prasthana. All rights reserved.
//

import UIKit

extension ViewController{
    
    func setupUI1(){
      SetupTitleText()
      SetupOrLAbel()
      SetupTerms_ConditionsLabel()
      SetupFacebookButton()
      SetupGoogleButton()
      SetupCreateAccountButton()
      
    
          
      }
    

  func  SetupTitleText(){
    let title = "Create a new account"
    let subTitle = "\n\nYou need to create a new account to go further."
    
    let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.init(name: "DIDot", size: 28)!, NSAttributedString.Key.foregroundColor: UIColor.systemGray])
    let attributtedSubTitle = NSMutableAttributedString(string: subTitle, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),NSAttributedString.Key.foregroundColor: UIColor.systemGray])
    
    attributedText.append(attributtedSubTitle)
    
    let paragraphStyle = NSMutableParagraphStyle()
           paragraphStyle.lineSpacing = 5
           
           attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
           title_Label.numberOfLines = 0
           
           
           title_Label.attributedText = attributedText
           
        
    }
    
    func SetupOrLAbel(){
        Or_Label.text = "Or"
        Or_Label.font = UIFont.boldSystemFont(ofSize: 16)
        Or_Label.textColor = UIColor (white: 0, alpha: 0.45)
        Or_Label.textAlignment = .center
        
    }
    
    
    func SetupFacebookButton(){
        signIn_Facebook_Button.setTitle("Sign in with Facebook", for: UIControl.State.normal)
        signIn_Facebook_Button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signIn_Facebook_Button.backgroundColor = UIColor(red: 58/255, green: 85/255, blue: 159/255, alpha: 1)
        signIn_Facebook_Button.layer.cornerRadius = 5
        signIn_Facebook_Button.clipsToBounds = true
        
        
        
    }
    
    
    func SetupGoogleButton(){
        sigIn_Google_Button.setTitle("Sign in with Google", for: UIControl.State.normal)
        sigIn_Google_Button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        sigIn_Google_Button.backgroundColor = UIColor(red: 223/255, green: 74/255, blue: 50/255, alpha: 1)
        sigIn_Google_Button.layer.cornerRadius = 5
        sigIn_Google_Button.clipsToBounds = true
        
        
    }
    
    func SetupCreateAccountButton(){
        createAccount_button.setTitle("Create a new account", for: UIControl.State.normal)
        createAccount_button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        createAccount_button.backgroundColor = UIColor.black
        createAccount_button.layer.cornerRadius = 5
        createAccount_button.clipsToBounds = true
        
    }
    
    func SetupTerms_ConditionsLabel(){
        let attributtedTermsText = NSMutableAttributedString(string: "By clicking Create a new account you agree to our \nTerms & Conditions", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.systemGray])
               
               let attributtedSubTermsText = NSMutableAttributedString(string: "Terms and Conditions.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.systemGray])
               attributtedSubTermsText.append(attributtedSubTermsText)
               
               Terms_Label.attributedText = attributtedTermsText
               Terms_Label.numberOfLines = 0
        
        
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
