//
//  StartView.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import SwiftUI



struct StartView: View {
    
    @StateObject private var startViewModel = StartViewModel()
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var body: some View {
        Spacer()
        VStack{
            Text("Bienvenido, por favor, ingrese un país y los parámetros de las fechas")
        }
        Spacer()
        VStack{
            // Primer DatePicker para la fecha de inicio
            DatePicker("Fecha de inicio:", selection: $startViewModel.startDate, in: ...Date(),
                       displayedComponents: [.date])
            .onChange(of: startViewModel.startDate) { _ in
                // Actualizar la vista cuando cambia la fecha
            }
            .padding()
            
            // Segundo DatePicker para la fecha de fin
            DatePicker("Fecha de fin:", selection: $startViewModel.endDate, in: ...Date(),
                       displayedComponents: [.date])
            .onChange(of: startViewModel.startDate) { _ in
                // Actualizar la vista cuando cambia la fecha
            }
            .padding()
            
            // TextField para el texto
            TextField("Ingresa un país", text: $startViewModel.textInput)
                .padding()
        }
        Spacer()
        VStack{
            NavigationLink(destination: DetailView())
            {
                Text("Aceptar")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .simultaneousGesture(
                TapGesture().onEnded {
                    // Función que se ejecuta al activar el NavigationLink
                    startViewModel.procesarDatoss()
                }
            )
            Spacer()
            
        }
    }
}
    
#Preview {
    StartView()
    
}
