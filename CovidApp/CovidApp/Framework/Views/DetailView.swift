//
//  DetailView.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//
import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel = StartViewModel()

    var body: some View {
         VStack {
             if let countryData = viewModel.casosDesempaquetados {
                 Text("Datos del país: \(countryData.country)")
                     .font(.title)

                 List(countryData.cases.sorted(by: { $0.key > $1.key }), id: \.key) { date, caseData in
                     VStack(alignment: .leading) {
                         Text("Fecha: \(date)")
                         Text("Total de casos: \(caseData.total)")
                         Text("Nuevos casos: \(caseData.new)")
                     }
                 }
             } else {
                 Text("No hay datos disponibles")
             }
         }
         .padding()
     }
 }

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Crea una instancia de DetailViewModel y pásala a la vista previa
        DetailView()
    }
}

