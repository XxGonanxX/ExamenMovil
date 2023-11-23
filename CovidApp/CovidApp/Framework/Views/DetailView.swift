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
        VStack {
            List(detailViewModel.casesList) { caseItem in
                Text("Fecha de Inicio: \(caseItem.date)")
            }

            // Muestra la respuesta de la API
            Text("API Response: \(detailViewModel.apiResponse.map { "\($0)" } ?? "No data")")
        }
        .onAppear {
            Task {
                // Llama a la función para obtener los casos y actualiza apiResponse
                await detailViewModel.getCasesList(forCountry: "Pais", startDate: "2022-11-23", endDate: "2023-11-23")
            }
        }
    }
}
