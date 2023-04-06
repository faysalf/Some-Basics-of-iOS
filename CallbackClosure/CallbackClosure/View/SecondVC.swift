//
//  SecondVC.swift
//  CallbackClosure
//
//  Created by Md. Faysal Ahmed on 12/1/23.
//

import UIKit

// Callback Model: SecondViewController to homeViewController
class SecondVC: UIViewController {
    
    typealias completionHandler = ([String: String]) -> Void    //
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    var completion: completionHandler?          //
    
    @IBAction func submitAction(_ sender: UIButton) {
        
        guard let name = name.text else { return }
        guard let password = password.text else { return }
        
        let dict = ["name":name, "password":password]
        
        guard let completion = completion else { return }
        completion(dict)
        self.dismiss(animated: true)
    }
    
}
