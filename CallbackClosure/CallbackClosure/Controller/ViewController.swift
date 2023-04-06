//
//  ViewController.swift
//  CallbackClosure
//
//  Created by Md. Faysal Ahmed on 12/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var passLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func homeButtonAction(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Second", bundle: nil).instantiateViewController(withIdentifier: "SecondID") as! SecondVC
        vc.completion = { dict in                       // main
            self.nameLbl.text = dict["name"]
            self.passLbl.text = dict["password"]
        }
        self.present(vc, animated: true)
    }

}

