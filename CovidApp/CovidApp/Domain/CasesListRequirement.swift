//
//  CasesListRequirement.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation

protocol CaseListRequierementProtocol {
    func getCasesList(limit: Int) async -> Cases?
    
}
    
class CaseListRequirement: CaseListRequierementProtocol {

    static let shared = CaseListRequirement()

    func getCasesList(limit: Int) async -> Cases? {
        return await dataRepository.getCaseList(limit: limit)
    }
    
    let dataRepository: CaseRepository
    
    init(dataRepository: CaseRepository = CaseRepository.shared) {
        self.dataRepository = dataRepository
    }
}
