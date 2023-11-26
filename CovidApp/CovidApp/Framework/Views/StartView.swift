//
//  StartView.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import SwiftUI



struct StartView: View {
    
    @StateObject private var startViewModel = StartViewModel()
    @State public var prueba1: String
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Bienvenido, por favor, ingrese un país o una fecha (no ambos)")
                    .padding()
                
                TextField("Ingresa una fecha" , text: $prueba1)
                    .keyboardType(.numbersAndPunctuation)
                    .padding()
                
                // TextField para el texto
                TextField("Ingresa un país", text: $prueba1)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    Task{
                        let results = await startViewModel.procesarDatoss()
                        Text("Resultados")
                    }
                                
                }) {
                    Text("Aceptar")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Spacer()
            }
            
            Spacer()
            
            
        }
    }
}

    
#Preview {
    StartView(prueba1: String())
    
}
