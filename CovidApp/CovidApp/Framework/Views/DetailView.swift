//
//  DetailView.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//
import SwiftUI

struct DetailView: View {
    @ObservedObject var detailViewModel = DetailViewModel()
    
    var body: some View {
        VStack {
             List(detailViewModel.casesList, id: \.id) { dateCase in
                // Aquí debes poner las vistas que deseas mostrar para cada elemento de la lista
                Text("Some view for \(dateCase)")
            }
            
        }
        .onAppear{
            detailViewModel.getCasesList(forCountry: "\($detailViewModel.country)", startDate: "\($detailViewModel.startDate)", endDate: "\($detailViewModel.endDate)")
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
