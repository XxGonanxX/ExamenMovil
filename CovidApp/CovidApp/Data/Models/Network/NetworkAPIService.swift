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
    let baseURL = "https://api.api-ninjas.com/v1/covid19"
    
    func sendCaseData(startDate: String, endDate: String, country: String?, limit: Int) async -> Cases? {
        let url = URL(string: "\(baseURL)?date=\(startDate)&\(endDate)&country=\(country ?? "")")!

        let headers: HTTPHeaders = [
            "X-Api-Key": apiKey
        ]

        let taskRequest = AF.request(url, method: .get, headers: headers).validate()
        let response = await taskRequest.serializingData().response
        
        print(taskRequest)
        print(response)
        
        switch response.result {
        case .success(let data):
            do {
                if let jsonString = String(data: data, encoding: .utf8) {
                               print("JSON Response: \(jsonString)")
                           }
                return try JSONDecoder().decode(Cases.self, from: data)
            } catch {
                return try nil
            }
        case .failure(let error):
            debugPrint(error.localizedDescription)
            if let data = response.data {
                let stringData = String(data: data, encoding: .utf8)
                print("Response Data: \(stringData ?? "Unable to decode data")")
            }
            return nil
        }

    }
}
