//
//  API+SingleGet.swift
//  API-Alamofire
//
//  Created by Md. Faysal Ahmed on 27/3/23.
//

import Foundation

// MARK: - SingleGetModel
struct SingleGetModel: Codable {
    let data: UserInfoModel
    let support: Support
}

struct UserInfoModel: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

struct Support: Codable {
    let url: String
    let text: String
}
