//
//  LeftSidePanelVC.swift
//  UberClone
//
//  Created by Hardi B. Salih on 13.02.2023.
//

import UIKit

class LeftSidePanelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signUpLoginBtnWasPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        present(loginVC!, animated: true, completion: nil)
    }
}
