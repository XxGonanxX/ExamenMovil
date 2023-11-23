//
//  NetworkAPIService.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation
import Alamofire

class NetworkAPIService {
    static let shared = NetworkAPIService()
    
    let apiKey = "wQJQSBY0VEm6Si+tRjTpCQ==qTcldfbpLTdYr3Zc"
    
    
    func getCases(url: URL, Limit: Int) async -> Cases? {
        let parameters : Parameters = [
            "limit" : Limit
        ]
        
        var headers: HTTPHeaders = [:]
        headers["X-Api-Key"] = apiKey

        
        let taskRequest = AF.request(url, method: .get, parameters: parameters).validate()
        let response = await taskRequest.serializingData().response
        
        switch response.result{
        case.success(let data):
            do {
                return try JSONDecoder().decode(Cases.self, from: data)
            } catch {
                return nil
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}
