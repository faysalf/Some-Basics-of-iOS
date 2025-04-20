//
//  Protocol.swift
//  API-Alamofire
//
//  Created by Md. Faysal Ahmed on 25/3/23.
//

import UIKit

protocol singleValueTF {
    func dataForTransfer(value: SingleGetModel)
}

protocol listValueTF {
    func dataForTransfer(value: ListGetModel)
}

protocol loginToken {
    func token(value: LoginPostStatusModel)
}
