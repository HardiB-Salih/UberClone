//
//  LoginVC.swift
//  UberClone
//
//  Created by Hardi B. Salih on 13.02.2023.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController, UITextFieldDelegate, Alertable {
    
    @IBOutlet weak var emailField: RoundedCornerTextField!
    @IBOutlet weak var passwordField: RoundedCornerTextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var authBtn: RoundedShadowButton!
    @IBOutlet weak var actionBtnBottomConstrain: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        actionBtnBottomConstrain.constant = UIScreen.main.bounds.width - 40
        emailField.delegate = self
        passwordField.delegate = self
        print(segmentedControl.selectedSegmentIndex)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap(sender:)))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleScreenTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    @IBAction func dissmissBtnWasPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func authButnWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            actionBtnBottomConstrain.constant = 60
            authBtn.animateButton(shouldLoad: true, withMessage: nil)
            self.view.endEditing(true)
            
            
            if let email = emailField.text, let password = passwordField.text {
                
                Auth.auth().signIn(withEmail: email, password: password, completion: { userDataResult, error in
                    if error == nil {
                        if let userDataResult = userDataResult {
                            print("Hellow login")
                            let users = userDataResult.user
                            if self.segmentedControl.selectedSegmentIndex == 0 {
                                let userData = ["provider": users.providerID] as [String: Any]
                                DataService.instance.createFirebaseDBUser(uid: users.uid, userData: userData, isDriver: false)
                            } else {
                                let userData = ["provider": users.providerID, USER_IS_DRIVER: true, ACCOUNT_PICKUP_MODE_ENABLED: false, DRIVER_IS_ON_TRIP: false] as [String: Any]
                                DataService.instance.createFirebaseDBUser(uid: users.uid, userData: userData, isDriver: true)

                            }
                        }
                        
                        self.dismiss(animated: true)
                    } else {
//                        if let errorCode = AuthErrorCode.Code(rawValue: error!._code) {
//                            switch errorCode {
//                            case .wrongPassword:
//                                self.showAlert(ERROR_MSG_WRONG_PASSWORD)
//                            default:
//                                self.showAlert(ERROR_MSG_UNEXPECTED_ERROR)
//                            }
//                        }
                        Auth.auth().createUser(withEmail: email, password: password, completion: { authResult, error in
                            if error != nil {
                                if let errorCode = AuthErrorCode.Code(rawValue: error!._code) {
                                    switch errorCode {
                                    case .invalidEmail:
                                        self.showAlert(ERROR_MSG_INVALID_EMAIL)
                                    default:
                                        self.showAlert(ERROR_MSG_UNEXPECTED_ERROR)
                                    }
                                }
                            } else {
                                if let userDataResult = authResult {
                                    let users = userDataResult.user
                                    if self.segmentedControl.selectedSegmentIndex == 0 {
                                        let userData = ["provider": users.providerID] as [String: Any]
                                        DataService.instance.createFirebaseDBUser(uid: users.uid, userData: userData, isDriver: false)
                                    } else {
                                        let userData = ["provider": users.providerID, USER_IS_DRIVER: true, ACCOUNT_PICKUP_MODE_ENABLED: false, DRIVER_IS_ON_TRIP: false] as [String: Any]
                                        DataService.instance.createFirebaseDBUser(uid: users.uid, userData: userData, isDriver: true)

                                    }
                                }
                                self.dismiss(animated: true)
                            }
                        })
                    }
                })
            }
        }
    }
}
