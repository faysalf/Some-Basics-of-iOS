//
//  ViewController.swift
//  FirebaseEmailPassLoginAdv
//
//  Created by Md. Faysal Ahmed on 25/12/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

var fromLogIn: Bool = false

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLablel: UILabel!
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TransferToLogIn()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let id = UserDefaults.standard.bool(forKey: "isOut")
        
        if id {
            TransferToLogIn()
        }
        else if !fromLogIn{
            nameLablel.text = UserDefaults.standard.string(forKey: "name")
        }
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        exit(0)
    }
    
    
    @IBAction func logOutAction(_ sender: UIButton) {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            UserDefaults.standard.set(true, forKey: "isOut")
            fromLogIn = false
            TransferToLogIn()
            
        }catch {
            print("Error:- ", error.localizedDescription)
        }
    }
    
    
    func TransferToLogIn() {
        
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignID") as! SignIn
        
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    
    func getData(email: String) {
        let docRef = database.document("\(email)/name")
        
        docRef.getDocument(completion: { [weak self] snapshot, error in
            
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            guard let name = data[email] as? String else {
                return
            }
            
            DispatchQueue.main.async {
                if let first = name.components(separatedBy: " ").first {
                    self?.nameLablel.text = "Hello \(first)!"
                    UserDefaults.standard.set("Hello \(first)!", forKey: "name")
                }

            }
        })
    }
    
    
}

extension ViewController: passEmail {
    
    func emailData(email: String) {
        
        getData(email: email)
    }

    
}
