//
//  ViewController.swift
//  FirebaseEmailPassLoginAdv
//
//  Created by Md. Faysal Ahmed on 25/12/22.
//

import UIKit
import FirebaseAuth

protocol passEmail {
    func emailData(email: String)
}

class SignIn: UIViewController {

    @IBOutlet weak var alertMassage: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var delegate: passEmail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alertMassage.isHidden = true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailField.becomeFirstResponder()
    }
    
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        exit(0)
    }
    
    
    @IBAction func signInButtonAction(_ sender: UIButton) {
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            
            alertMassage(txt: "Missing field Data!", delay: 3)
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email,
                                        password: password,
                                        completion: { [weak self] result, error in
            
            guard let strongSelf = self else { return }
            
            guard error == nil else {
                strongSelf.alertMassage(txt: error!.localizedDescription, delay: 4)
                return
            }
            
            strongSelf.alertMassage(txt: "You have successfully signed in!", delay: 1)
            UserDefaults.standard.set(false, forKey: "isOut")
            
            strongSelf.delegate?.emailData(email: email)
            fromLogIn = true
            strongSelf.dismiss(animated: true)
        })
        
    }
    
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignID") as! SignUp
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }


}



extension SignIn {
    
    func alertMassage(txt: String, delay: Int) {
        alertMassage.text = txt
        alertMassage.isHidden = false
        
        // For Delay
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay), execute: {
            self.alertMassage.isHidden = true
        })

    }
    
}
