//
//  ViewController.swift
//  Demo
//
//  Created by Reserveit Support on 18/4/23.
//

import UIKit

class ViewController: UIViewController {

    let restArr = ["a", "b", "c", "d", "e", "f", "g", "h"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btn()
    }

    func btn() {
        let b = UIButton(frame: CGRect(x: view.frame.width/2 - 50, y: 300, width: 100, height: 44))
        b.setTitle("Touch here", for: .normal)
        b.layer.cornerRadius = 8
        b.backgroundColor = .blue
        b.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(b)
    }
    
    @objc func didTapButton() {
        print("Taped")
        
//        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Close", style: .default))
//        let size = 200
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
//        imageView.contentMode = .scaleAspectFill
//        imageView.image = UIImage(named: "img")

//        alert.view.addSubview(imageView)
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.layer.masksToBounds = true
//        imageView.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor).isActive = true
//        imageView.centerYAnchor.constraint(equalTo: alert.view.centerYAnchor).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: CGFloat(size)).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: CGFloat(size)).isActive = true
//        present(alert, animated: true, completion: nil)
        
        let showAlert = UIAlertController(title: "Demo Alert", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 270))
        imageView.image = UIImage(named: "img") // Your image here...
        showAlert.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 310)
        let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
        showAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: { action in
            // your actions here...
        }))
        self.present(showAlert, animated: true, completion: nil)
        
    }
    

}
