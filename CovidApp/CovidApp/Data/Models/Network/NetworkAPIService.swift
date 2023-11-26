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

    func getCaseByCountry(url: URL, Country: String) async -> [CaseByCountry]? {
        let headers: HTTPHeaders = [
                    //La apiKey es la de mi cuenta así que no debería haber problemas
                    "X-Api-Key": "wQJQSBY0VEm6Si+tRjTpCQ==qTcldfbpLTdYr3Zc"
                ]
        
        // Hago la request a la URL
        let taskRequest = AF.request(url, method: .get, headers: headers).validate()
        // Esperemos que haya una respuesta
        let response = await taskRequest.serializingData().response
        
        switch response.result {
        case .success(let data):
                // Si mi respuesta fue exitosa, decodeamos el JSON, si no, se regresa null
                do {
                    //if let jsonString = String(data: data, encoding: .utf8) {
                    //   print("JSON Response: \(jsonString)")
                    //   }
                    return try JSONDecoder().decode([CaseByCountry].self, from: data)
                } catch {
                    print("El decode falló")
                    return nil
                }
            case let .failure(error):
                debugPrint(error.localizedDescription)
                return nil
            }
        }
    
    func getCaseByDate(url: URL, Date: String) async -> [CaseByDate]? {
        let headers: HTTPHeaders = [
                    //La apiKey es la de mi cuenta así que no debería haber problemas
                    "X-Api-Key": "wQJQSBY0VEm6Si+tRjTpCQ==qTcldfbpLTdYr3Zc"
                ]
        // Hago la request a la URL
        let taskRequest = AF.request(url, method: .get, headers: headers).validate()
        // Esperemos que haya una respuesta
        let response = await taskRequest.serializingData().response
                
        switch response.result {
        case .success(let data):
                // Si mi respuesta fue exitosa, decodeamos el JSON, si no, se regresa null
                do {
                    print("Response Succeded")
                    //if let jsonString = String(data: data, encoding: .utf8) {
                    //    print("JSON Response: \(jsonString)")
                    //    }
                    return try JSONDecoder().decode([CaseByDate].self, from: data)
                } catch {
                    print("Not today bro")
                    debugPrint(error)
                    return nil
                }
            case let .failure(error):
                debugPrint(error.localizedDescription)
                return nil
            }

        }
    }
    
