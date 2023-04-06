//
//  CustomTabBarViewController.swift
//  iOS-InterviewTask
//
//  Created by Md. Faysal Ahmed on 26/1/23.
//

import Foundation
import UIKit

protocol TabBarProtocol: AnyObject {
    func tabBarChanged(index: Int)
}


class CustomTabBarViewController:  UITabBarController, UITabBarControllerDelegate {
    
    weak var tabBarDelegate: TabBarProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCustomTabBar()
        self.tabBar.isHidden = true
    }
    
    func getStoryboard(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }

    func setupCustomTabBar() {
        // 1
        guard let homeVC = loadVCfromStoryBoard(name: "Main", identifier: "ViewController") as? ViewController else{
            return
        }
        let firtsItem = HomeNabViewController(rootViewController: homeVC)

        // 2
        guard let searchVC = loadVCfromStoryBoard(name: "SearchVC", identifier: "SearchVC") as? SearchVC else{
            return
        }
        let secondItem = HomeNabViewController(rootViewController: searchVC)


        // 3
        guard let bookMarkVC = loadVCfromStoryBoard(name: "BookMarkVC", identifier: "BookMarkVC") as? BookMarkVC else{
            return
        }
        let thirdItem = HomeNabViewController(rootViewController: bookMarkVC)


        // 4
        guard let timerVC = loadVCfromStoryBoard(name: "TimerVC", identifier: "TimerVC") as? TimerVC else{
            return
        }
        let fourthItem = HomeNabViewController(rootViewController: timerVC)

        // 5
        guard let settingVC = loadVCfromStoryBoard(name: "SettingVC", identifier: "SettingVC") as? SettingVC else{
            return
        }
        let fifthItem = HomeNabViewController(rootViewController: settingVC)


        let tabBarItemList = [firtsItem, secondItem, thirdItem, fourthItem, fifthItem]
        self.viewControllers = tabBarItemList

        self.delegate = self


    }
}
