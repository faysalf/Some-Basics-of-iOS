//
//  Define.swift
//  CustomTabBar
//
//  Created by Md. Faysal Ahmed on 26/1/23.
//

import UIKit

let DEVICE_HEIGHT = UIScreen.main.bounds.size.height
let DEVICE_WIDTH = UIScreen.main.bounds.size.width

func loadVCfromStoryBoard(name: String, identifier: String) -> UIViewController {
    
    if #available(iOS 13.0, *) {
        return UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: identifier)
    } else {
        return UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
}
