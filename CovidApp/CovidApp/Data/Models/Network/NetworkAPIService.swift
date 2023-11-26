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
    
    func sendCaseData(startDate: String, endDate: String, country: String?, limit: Int) async throws -> [CountryData]? {
        print("En el networkapiservice")
        do {
            let url = URL(string: "\(baseURL)?startDate=\(startDate)&endDate=\(endDate)&country=\(country ?? "")&limit=\(limit)")!
            
            let headers: HTTPHeaders = [
                "X-Api-Key": apiKey
            ]
            
            let data = AF.request(url, method: .get, headers: headers).validate()
            let response = await data.serializingData().response
            
            // if let jsonString = String(data: data, encoding: .utf8) {
            // print("JSON Response: \(jsonString)")
            //  }
            
            switch response.result{
            case.success(let data):
                do {
                    print("Veamos el JSON")
                    return try JSONDecoder().decode([CountryData].self, from: data)
                } catch {
                    print("no jala")
                    return nil
                }
            case let .failure(error):
                debugPrint(error.localizedDescription)
                return nil
            }
        }
    }
    
}
