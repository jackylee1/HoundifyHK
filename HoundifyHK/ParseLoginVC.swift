//
//  ParseLoginVC.swift
//  HoundifyHK
//
//  Created by Eric Tan on 8/11/15.
//  Copyright (c) 2015 Harman International. All rights reserved.
//

import Foundation
import UIKit
import Parse
import ParseUI

class ParseLoginVC: PFLogInViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGrayColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        if (PFUser.currentUser() != nil) {
            self.performSegueWithIdentifier("goToMainVC", sender: self)
        }
        else {
            let logInViewController = PFLogInViewController()
            logInViewController.fields = (PFLogInFields.UsernameAndPassword
                | PFLogInFields.LogInButton
                | PFLogInFields.SignUpButton
                | PFLogInFields.PasswordForgotten)
            logInViewController.delegate = self
            self.presentViewController(logInViewController, animated: false, completion: nil)
            
            let signInViewController = PFSignUpViewController()
            signInViewController.delegate = self
            logInViewController.signUpController = signInViewController
        }
    }
    
    func logInViewController(controller: PFLogInViewController, didLogInUser user: PFUser) -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}