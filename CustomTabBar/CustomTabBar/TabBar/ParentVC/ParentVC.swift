//
//  ParentVC.swift
//  CustomTabBar
//
//  Created by Md. Faysal Ahmed on 26/1/23.
//

import UIKit

class ParentVC: UIViewController {
    
    let DEVICE_WIDTH = UIScreen.main.bounds.size.width
    let DEVOCE_HEIGHT = UIScreen.main.bounds.size.height
    let DELEGATE = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet var tabBurButtons: [UIButton]!
    
    var tabBarViewController: CustomTabBarViewController!
    var lastSelectedTab: Int = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTabBarController()
        Globalprotocol.shared.vcToTabbarDelegate = self
        //        Globalprotocol.shared.tabBarProtocol = self
        DELEGATE.parentVC = self
    }
    
    func setupTabBarController() {
        
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        tabBarViewController = (storyboard.instantiateViewController(withIdentifier: "CustomTabBarViewController") as! CustomTabBarViewController)
        tabBarViewController.tabBarDelegate = self
        tabBarViewController.view.frame = CGRect(x: 0, y: 0, width: DEVICE_WIDTH, height: DEVOCE_HEIGHT)
        self.view.addSubview(tabBarViewController.view)
        self.addChild(tabBarViewController)
        tabBarViewController.didMove(toParent: parent)
        tabBarViewController.tabBar.isHidden = true
        
        self.view.bringSubviewToFront(tabBarView)
        self.tabBarViewController.selectedIndex = 0
        
        //    self.view.bringSubviewToFront(scanneButton)
    }
    
    private func tabbarShould(isHide toggle: Bool){
        UIView.transition(with: self.tabBarView, duration: 0.2, options: .transitionCrossDissolve, animations: { [weak self] in
            guard let self = self else { return }
            self.tabBarView.isHidden = toggle
            self.tabBarView.frame.origin.y = (toggle) ? DEVICE_HEIGHT : DEVICE_HEIGHT - 88
        }, completion: nil)
    }
    
    @IBAction func tabBarButtonsAction(_ sender: UIButton) {
        self.lastSelectedTab = sender.tag
        self.tabBarViewController?.selectedIndex = sender.tag
        
    }
    
}


extension ParentVC: TabBarProtocol {
    func tabBarChanged(index: Int) {
        
    }
}

extension ParentVC: VCToTabBarProtocol {
    func showTabBar() {
        self.tabbarShould(isHide: false)
    }
    
    func hideTabBar() {
        self.tabbarShould(isHide: true)
    }
    
    func restoreaction() {
        
    }
}
