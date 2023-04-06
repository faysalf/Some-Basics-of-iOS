//
//  ViewController.swift
//  NotificationCenterDemo
//
//  Created by Md. Faysal Ahmed on 10/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Firsr call observer, then post. Observer is receiver though
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("demo"), object: nil)
    }
    
    
    @objc func didGetNotification(_ notification: Notification) {
        txt.text = notification.object as! String
        print("Notification Reeived!")
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)   //remove observer after finishing works
    }
    
    
    @IBAction func secondVC(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Second", bundle: nil).instantiateViewController(withIdentifier: "SecondID") as! SecondVC
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
        
    }
    
    

}

