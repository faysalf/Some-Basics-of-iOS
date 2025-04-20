//
//  API+ListGet.swift
//  API-Alamofire
//
//  Created by Md. Faysal Ahmed on 27/3/23.
//

import Foundation

// MARK: - ListGetModel
struct ListGetModel: Codable {
    let page, perPage, total, totalPages: Int
    let data: [UserInfoModel]
    let support: ListSupport

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

struct ListSupport: Codable {
    let url: String
    let text: String
}
