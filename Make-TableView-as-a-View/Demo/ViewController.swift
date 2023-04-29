//
//  ViewController.swift
//  Demo
//
//  Created by Reserveit Support on 18/4/23.
//

import UIKit

class ViewController: UIViewController {

    let restArr = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t"]
    var tv: CustomTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }

    private func setTableView() {
        tv = CustomTableView()
        tv.delegate = self
        
        tv.restaurantArr = restArr
        view.addSubview(tv)
        tv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tv.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            tv.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
    }
    

}


extension ViewController: didTapOnCell {
    func delegateTV(indexPath: IndexPath) {
        print(indexPath)
    }
    
    
}
