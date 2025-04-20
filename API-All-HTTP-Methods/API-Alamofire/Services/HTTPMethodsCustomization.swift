//
//  HTTPMethodsCustomization.swift
//  API-Alamofire
//
//  Created by Md. Faysal Ahmed on 25/3/23.
//

import UIKit
import Alamofire

enum NetworkError: Error {
    case error(message: String)
}

class HTTPMethodsCustomization {
    
    let baseURL = "https://reqres.in/"
    
    // MARK: - Single Get
    func singleMethodGet(
        endPoint: String,
        completion: @escaping ((Result<SingleGetModel, Error>)-> Void)
    ) {
        AF.request(baseURL + endPoint).responseJSON { response in
            debugPrint(response.response?.statusCode)
            
            switch response.result {
            case .success(let value):
                guard let jsonData = try? JSONSerialization.data(withJSONObject: value, options: []),
                      let myData = try? JSONDecoder().decode(SingleGetModel.self, from: jsonData) else {
                    completion(.failure(NetworkError.error(message: "Error happed to fetch a single user")))
                    return
                }
                debugPrint(myData)
                completion(.success(myData))
                
            case .failure(let error):
                debugPrint("Error retrieving data: \(error)")
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - List Get Method
    func listMethodGet(endPoint: String, completion: @escaping ((Result<ListGetModel, Error>)-> Void)) {
        AF.request(
            baseURL + endPoint
        ).responseJSON { response in
            print(response.response?.statusCode)
            
            switch response.result {
            case .success(let value):
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: value, options: []),
                      let myData = try? JSONDecoder().decode(ListGetModel.self, from: jsonData) else {
                    completion(.failure(NetworkError.error(message: "Error happed to fetch list of users")))
                    return
                }
                completion(.success(myData))
                
            case .failure(let error):
                print("Error retrieving data: \(error)")
                completion(.failure(error))
            }
        }
    }
    
    // MARK: Patch
    func patchMethod(
        endPoint: String,
        completion: @escaping ((Result<String, Error>)-> Void)
    ) {
        AF.request(baseURL + endPoint, method: .patch).responseJSON { response in
            if response.response?.statusCode == 200 {
                completion(.success("Success patch request"))
            }else {
                completion(.failure(NetworkError.error(message: "Error to post a patch request")))
            }
        }
    }
    
    // MARK: - Post Method
    func postMethod(
        endPoint: String,
        parameter: PostModel,
        completion: @escaping ((Result<String, Error>)-> Void)
    ) {
        AF.request(baseURL + endPoint, method: .post, parameters: parameter, encoder: JSONParameterEncoder.default).responseJSON { response in
            print(response.response?.statusCode)
            
            if response.response?.statusCode == 201 {
                completion(.success("Success post request"))
            }else {
                completion(.failure(NetworkError.error(message: "Error Post request")))
            }
        }
    }
    
    func loginPostMethod(
        endPoint: String,
        parameter: LoginPostModel,
        completion: @escaping ((Result<String, Error>)-> Void)
    ) {
        
        AF.request(
            baseURL + endPoint,
            method: .post,
            parameters: parameter,
            encoder: JSONParameterEncoder.default
        ).responseJSON { response in
            print(response.response?.statusCode)
            
            switch response.result {
            case .success(let value):
                guard let jsonData = try? JSONSerialization.data(withJSONObject: value, options: []),
                      let myData = try? JSONDecoder().decode(LoginPostStatusModel.self, from: jsonData) else {
                    completion(.failure(NetworkError.error(message: "Error happed to login")))
                    return
                }
                completion(.success("login token: \(myData.token)"))
                
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(NetworkError.error(message: "Error happed to login")))
            }
        }
    }
    
    // MARK: - Put Method
    func putMethod(
        endPoint: String,
        parameter: NSDictionary,
        completion: @escaping ((Result<String, Error>)-> Void)
    ) {
        let param: [String: Any] = [
            "Email": "faysal.ahmed@reserveitbd.com",
            "Name": "Faysal Ahmed",
            "Password": "faysalf123"
        ]
        AF.request(
            baseURL + endPoint,
            method: .put,
            parameters: parameter as? Parameters,
            encoding: JSONEncoding.default
        ).responseJSON { response in
            
            if response.response?.statusCode == 200 {
                completion(.success("Success put request"))
            }else {
                completion(.failure(NetworkError.error(message: "Error put request")))
            }
        }
    }
    
    // MARK: - Delete method
    func deleteMethod(
        endPoint: String,
        completion: @escaping ((Result<String, Error>)-> Void)
    ) {
        AF.request(baseURL + endPoint,
                   method: .delete).responseJSON { response in
            if response.response?.statusCode == 204 {
                completion(.success("Success delete request"))
            }else {
                completion(.failure(NetworkError.error(message: "Error delete request")))
            }
            
        }
    }
    
}
