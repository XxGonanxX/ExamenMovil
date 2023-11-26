//
//  DetailView.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//
import SwiftUI

struct DetailView: View {
    @State var caseList = [CaseByDate]()
    @State var caseListCountry = [CaseByCountry]()
    @State var totalCases = 0

    var body: some View {
        HStack{
            Text("País |")
            Text("Nuevos Casos |")
            Text("Total de casos")
        }
        HStack {
            Text("Total de casos: \(totalCases)")
        }
        
        HStack{
            List(caseList) { caseByDate in
                VStack() {
                    Text("\(caseByDate.country) |")
                    Text("\(caseByDate.cases.new) |")
                    Text("\(caseByDate.cases.total)")// Acceder a la propiedad 'cases' del elemento
                }
            }
            .task {
               await getCaseByDate()
            }
            
            List(caseListCountry, id: \.country) {data in
                VStack(alignment: .leading) {
                    Text("\(data.country) |")
                    List(data.cases.sorted(by: { $0.key < $1.key }), id: \.key) { date, caseData in
                        Text("\(date):")
                        Text("\(caseData.total) |")
                        Text("\(caseData.new)")
                    }
                }
            }
            .task {
                await getCaseByCountry()
            }
        }
    }

    func getCaseByDate() async {
        do {
            let repository = CasesRepository()
            if let result = try await repository.getCaseByDate(date: "2022-05-05") {
                var tempCaseByDate = [CaseByDate]()
                for (index, casesData) in result.enumerated() {
                    let tempCase = CaseByDate(id: UUID(), country: casesData.country, region: casesData.region, cases: casesData.cases)
                    tempCaseByDate.append(tempCase)
                    totalCases += 1
                }
                
                caseList = tempCaseByDate
            }
        } catch {
            print("Error: \(error)")
        }
    }
    
    
    func getCaseByCountry() async {
        do {

            let repository = CasesRepository()
            print(try await repository.getCaseByCountry(country: "Mexico"))
            if let resultCountry = try await repository.getCaseByCountry(country: "Mexico") {
                var tempCaseByCountry = [CaseByCountry]()
                for (index, casesData) in resultCountry.enumerated() {
                    let tempCase = CaseByCountry(id: UUID(), country: casesData.country, region: casesData.region, cases: casesData.cases)
                    tempCaseByCountry.append(tempCase)
                    totalCases += 1
                }
                
                caseListCountry = tempCaseByCountry
            }

        } catch {
            print("Error: \(error)")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Crea una instancia de DetailViewModel y pásala a la vista previa
        DetailView()
    }
}

