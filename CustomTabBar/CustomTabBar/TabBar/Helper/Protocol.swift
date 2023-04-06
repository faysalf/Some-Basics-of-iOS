//
//  Protocol.swift
//  CustomTabBar
//
//  Created by Md. Faysal Ahmed on 26/1/23.
//

import Foundation
import Photos

class Globalprotocol {
    
    static let shared = Globalprotocol()
    weak var tabBarProtocol : TabBarProtocol!
    //weak var tabBarToVCDelegate : TabBarToVCProtocol!
    weak var vcToTabbarDelegate : VCToTabBarProtocol!
    //weak var parentToVoice : ParentToVoice!
    weak var dataPassDelegate: DataPassProtol!
    private init(){}
    
}

protocol VCToTabBarProtocol: AnyObject {
    func showTabBar()
    func hideTabBar()
    func restoreaction()
}

protocol DataPassProtol: AnyObject {
    func passSelectedAsset(_ phAsset: [PHAsset], isAdding operation: Bool)
}

