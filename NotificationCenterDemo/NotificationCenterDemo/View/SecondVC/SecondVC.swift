//
//  SecondVC.swift
//  NotificationCenterDemo
//
//  Created by Md. Faysal Ahmed on 10/1/23.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var txtInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func submitAction(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: Notification.Name("demo"), object: txtInput.text)
    }
    
    
    
    @IBAction func backAction(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
    

}
