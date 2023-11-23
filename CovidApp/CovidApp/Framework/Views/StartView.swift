//
//  StartView.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import SwiftUI

struct StartView: View {
    
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var textInput = ""
    
    var body: some View {
        Spacer()
        VStack{
            Text("Bienvenido, por favor, ingrese un país y los parámetros de las fechas")
        }
        Spacer()
        VStack{
            // Primer DatePicker para la fecha de inicio
                       DatePicker("Fecha de inicio:", selection: $startDate, displayedComponents: .date)
                           .padding()

                       // Segundo DatePicker para la fecha de fin
                       DatePicker("Fecha de fin:", selection: $endDate, displayedComponents: .date)
                           .padding()

                       // TextField para el texto
                       TextField("Ingresa un país", text: $textInput)
                           .padding()
        }
        Spacer()
        VStack{
            Button(action: {
                                // Aquí puedes agregar la lógica que se ejecutará cuando se presione el botón
                                print("Botón presionado")
                            }) {
                                Text("Aceptar")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
        }
        Spacer()
        
    }
}

#Preview {
    StartView()
}
