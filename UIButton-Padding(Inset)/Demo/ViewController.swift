//
//  ViewController.swift
//  Demo
//
//  Created by Reserveit Support on 18/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn()
    }

    func btn() {
        let b = UIButton(frame: CGRect(x: view.frame.width/2 - 50, y: 300, width: 120, height: 64))

        b.setImage(Resources.scanner, for: .normal)
        b.layer.cornerRadius = 8
        b.backgroundColor = .systemPurple
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        b.contentEdgeInsets = insets
        b.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(b)
    }
    
    @objc func didTapButton(sender: UIButton) {
        print("Taped")
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            sender.setImage(nil, for: .normal)
            sender.setImage(Resources.img, for: .normal)
            let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            sender.contentEdgeInsets = insets
        }else {
            sender.setImage(nil, for: .normal)
            sender.setImage(Resources.scanner, for: .normal)
            let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            sender.contentEdgeInsets = insets
        }
    }
    

}
