//
//  DetailView.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import SwiftUI




struct ContentView: View {
    @StateObject var detailViewModel = DetailViewModel()
    
    var body: some View {
        NavigationView {
        //    List(detailViewModel.casesList) { caseBase in
                NavigationLink{
                 //   PokemonDetailView(pokemonBase: pokemonBase)
                } label: {
                    HStack {
                       // Text(pokemonBase.pokemon.name)
                    }
                }
            }.onAppear {
                Task {
                 //   await detailViewModel.getCasesList()
                    
                }
            }
        }
    }
// }

    

