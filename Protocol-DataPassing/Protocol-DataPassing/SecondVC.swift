//
//  SecondVC.swift
//  Protocol-DataPassing
//
//  Created by Md. Faysal Ahmed on 19/1/23.
//

import UIKit

protocol DemoPass {
    func addNote(txt: String)
}

class SecondVC: ViewController {
    
    @IBOutlet weak var txtField: UITextField!
    
    var delegate: DemoPass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func submitAction(_ sender: UIButton) {
        if let text = txtField.text {
            delegate?.addNote(txt: text)
        }
        dismiss(animated: true)
    }
}
