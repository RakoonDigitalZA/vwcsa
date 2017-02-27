//
//  LoginViewController.swift
//  VWCSA
//
//  Created by Robert on 2017/02/27.
//  Copyright © 2017 Robert. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var username = ""
    var password = ""
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Methods
    func logUserIn () {
        FIRAuth.auth()?.signIn(withEmail: username, password: password, completion: { (user, error) in
            
            guard user != nil  else {
                print("\(error)")
                return
            }
            
            //Login success
        })
    }
    
    //MARK: UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
   
        switch (textField){
        case usernameTextField:
            username = textField.text!
        default:
            password = textField.text!
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(textField == usernameTextField){
            passwordTextField.becomeFirstResponder()
        }else {
            passwordTextField.resignFirstResponder()
            logUserIn()
        }
        
        return true
    }
}


