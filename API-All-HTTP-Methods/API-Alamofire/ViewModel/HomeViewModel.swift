//
//  HomeViewModel.swift
//  API-Alamofire
//
//  Created by Md. Faysal Ahmed on 20/4/25.
//

import Foundation

class HomeViewModel {
    
    let client = HTTPMethodsCustomization()
    
    func getSingleUser(completion: @escaping ((Result<SingleGetModel, Error>)-> Void)) {
        client.singleMethodGet(
            endPoint: "api/users/2",
            completion: completion
        )
    }
    
    func getUserList(pageNo: Int, completion: @escaping ((Result<ListGetModel, Error>)-> Void)) {
        client.listMethodGet(
            endPoint: "api/users?page=\(pageNo)",
            completion: completion
        )
    }
    
    func patchRequest(completion: @escaping ((Result<String, Error>)-> Void)) {
        client.patchMethod(
            endPoint: "api/users/2",
            completion: completion
        )
    }
    
    func createAnUser(params: PostModel, completion: @escaping ((Result<String, Error>)->Void)) {
        client.postMethod(
            endPoint: "api/users",
            parameter: params,
            completion: completion
        )
    }
    
    func updateAnUserInfo(userId: Int, completion: @escaping ((Result<String, Error>)->Void)) { // uid 2
        let param: [String: Any] = [
            "Email": "faysal.ahmed@reserveitbd.com",
            "Name": "Faysal Ahmed",
            "Password": "faysalf123"
        ]
        client.putMethod(
            endPoint: "api/users/\(userId)",
            parameter: param as NSDictionary,
            completion: completion
        )
    }
    
    func removeAnUser(userId: Int, completion: @escaping ((Result<String, Error>)->Void)) { // uid 2
        client.deleteMethod(
            endPoint: "api/users/\(userId)",
            completion: completion
        )
    }
    
    func loginUser(completion: @escaping ((Result<String, Error>)->Void)) {
        let user = LoginPostModel(
            email: "eve.holt@reqres.in",
            password: "cityslicka"
        )
        client.loginPostMethod(
            endPoint: "api/login",
            parameter: user,
            completion: completion
        )
    }
    
}
