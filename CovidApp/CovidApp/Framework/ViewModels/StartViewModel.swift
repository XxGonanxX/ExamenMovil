//
//  StartViewModel.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation


class StartViewModel: ObservableObject {
    
    @Published var startDate = Date()
    @Published var endDate = Date()
    @Published var textInput = ""
    
    func procesarDatos() {
            // Aquí puedes agregar la lógica para procesar los datos ingresados
            print("Fecha de inicio: \(startDate)")
            print("Fecha de fin: \(endDate)")
            print("Texto ingresado: \(textInput)")
        }    
    //TODO: mandar los datos a la API
    
    
}
