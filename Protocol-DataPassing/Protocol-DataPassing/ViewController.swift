//
//  ViewController.swift
//  Protocol-DataPassing
//
//  Created by Md. Faysal Ahmed on 19/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func secondAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondID") as! SecondVC
        vc.delegate = self              /////
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
    }


}


extension ViewController: DemoPass {
    func addNote(txt: String) {
        self.txt.text = txt
    }
    
}
