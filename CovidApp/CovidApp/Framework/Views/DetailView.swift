//
//  DetailView.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//
import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel = StartViewModel()
    @State private var isLoading = false

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Cargando...")
            } else {
                content
            }
        }
        .onAppear {
            Task {
                await fetchData()
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        if let firstCountry = viewModel.casosDesempaquetados.first {
            VStack {
                Text("Datos del país: \(firstCountry.country)")
                    .font(.title)

                List(firstCountry.cases.sorted(by: { $0.key > $1.key }), id: \.key) { date, caseData in
                    VStack(alignment: .leading) {
                        Text("Fecha: \(date)")
                        Text("Total de casos: \(caseData.total)")
                        Text("Nuevos casos: \(caseData.new)")
                    }
                }
            }
        } else {
            Text("No hay datos disponibles")
        }
    }

    private func fetchData() async {
        isLoading = true
        await viewModel.procesarDatos()
        isLoading = false
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Crea una instancia de DetailViewModel y pásala a la vista previa
        DetailView()
    }
}

