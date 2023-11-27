//
//  DetailView.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//
import SwiftUI

struct DetailView: View {
    @StateObject private var detailViewModel = DetailViewModel()

    var body: some View {
        HStack{
            Text("País |")
            Text("Nuevos Casos |")
            Text("Total de casos")
        }
        HStack {
            Text("Total de casos: \(detailViewModel.totalCases)")
        }
        

            List(detailViewModel.caseList) { caseByDate in
                VStack() {
                    Text("\(caseByDate.country) |")
                    Text("\(caseByDate.cases.new) |")
                    Text("\(caseByDate.cases.total)")// Acceder a la propiedad 'cases' del elemento
                }
            }
            .task {
                await detailViewModel.getCaseByDate()
                
            }
        
        
            List(detailViewModel.caseListCountry) {caseByCountry in
                VStack() {
                    Text("\(caseByCountry.country) |")
                    ForEach(caseByCountry.cases.sorted(by: { $0.key < $1.key }), id: \.key) { date, caseData in
                        Text("\(date):")
                        Text("\(caseData.total) | \(caseData.new)")
                    }
                }
            }
            .task {
                await detailViewModel.getCaseByCountry()
            }
        }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Crea una instancia de DetailViewModel y pásala a la vista previa
        DetailView()
    }
}

