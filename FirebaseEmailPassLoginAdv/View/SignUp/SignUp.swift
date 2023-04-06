//
//  SignUp.swift
//  FirebaseEmailPassLoginAdv
//
//  Created by Md. Faysal Ahmed on 25/12/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUp: UIViewController {
    
    @IBOutlet weak var alertMassage: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let database = Firestore.firestore()        // for databse
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertMassage.isHidden = true

    }
    
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
                
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty,
              let name = nameField.text, !name.isEmpty else {
            
            alertMassage(txt: "Missing field Data!", delay: 3)
            return
        }

        FirebaseAuth.Auth.auth().createUser(withEmail: email,
                                            password: password,
                                            completion: { [weak self] result, error in
            
            guard error == nil else {
                self?.alertMassage(txt: error!.localizedDescription, delay: 4)
                return
            }
            
            self?.alertMassage(txt: "You have successfully signed up! Please log in.", delay: 2)
            self?.saveData(email: email, name: name)        // Saving data to database
            self?.dismiss(animated: true)
        })
    }
    
}


extension SignUp {
    func alertMassage(txt: String, delay: Int) {
        alertMassage.text = txt
        alertMassage.isHidden = false
        
        // For Delay
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay), execute: {
            self.alertMassage.isHidden = true
        })

    }
    
    // MARK: - Save data to database
    func saveData(email: String, name: String) {
        
        let docRef = database.document("\(email)/name")
        docRef.setData([email: name as Any])
    }
}
