//
//  StartView.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var viewModel = DetailViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Bienvenido, por favor, ingrese un país o una fecha, no es necesario que ingreses ambos.")
                
                VStack {
                    TextField("Ingresa la fecha", text: $viewModel.inputDate)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Ingresa país", text: $viewModel.inputCountry)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                Spacer()
                Button(action: {
        
                })
                {
                    NavigationLink(destination: DetailView()) {
                        
                        Text("Aceptar")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                
            }
        }
    }
                
}

#Preview {
    StartView()
    
}
