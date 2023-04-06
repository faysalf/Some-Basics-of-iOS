//
//  RootNabViewController.swift
//  CustomTabBar
//
//  Created by Md. Faysal Ahmed on 26/1/23.
//

import UIKit

class RootNabViewController: UINavigationController {
    
    var isStatusBarHide: Bool = true
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isHidden = true
    }
}

class HomeNabViewController: UINavigationController {
    
    var isStatusBarHide: Bool = true
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
    }
}
