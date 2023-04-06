//
//  ViewController.swift
//  LaunchingPage-iOS
//
//  Created by Md. Faysal Ahmed on 6/4/23.
//

// First We need to make launchView navigation controller as initial viewcontroller. and check out the main vc as initial vc.
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        self.view.addSubview(myLabel())
    }
    
    func myLabel() -> UILabel {
        let lbl = UILabel(frame: CGRect(x: 16, y: 100, width: self.view.frame.width - 32, height: 40))
        lbl.layer.cornerRadius = 5
        lbl.text = "Welcome to Home VC"
        lbl.backgroundColor = .systemGray
        lbl.textColor = .white
        lbl.textAlignment = .center
        
        return lbl
    }


}

