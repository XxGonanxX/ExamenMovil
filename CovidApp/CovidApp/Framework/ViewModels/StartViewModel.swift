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
    var detailView: DetailView?
    @Published var cases: [CountryData] = []
    private var casos: [CountryData]?
    
    
    private let casesRepository: CaseRepository

        init(casesRepository: CaseRepository = CaseRepository.shared) {
            self.casesRepository = casesRepository
        }
    
    func procesarDatoss() {
              // Aquí puedes agregar la lógica para procesar los datos ingresados
        print("Fecha de inicio: \(StartView.dateFormatter.string(from: startDate))")
        var startDate = StartView.dateFormatter.string(from: startDate)
        print("Fecha de fin: \(StartView.dateFormatter.string(from: endDate))")
        var endDate = StartView.dateFormatter.string(from: endDate)
        print("Texto ingresado: \(textInput)")
        
        Task{
            await procesarDatos()
        }
          }

    func procesarDatos() async {
        casos = await casesRepository.sendCaseData(startDate: StartView.dateFormatter.string(from: startDate), endDate: StartView.dateFormatter.string(from: endDate), country: textInput, limit: 10)
        
        if let casosDesempaquetados = casos {
            // Hacer algo con los datos devueltos por la API, por ejemplo, imprimirlos
            print("Ahora van los casos")
            print(casosDesempaquetados)
            
        } else {
            print("No se obtuvieron casos")
        }
        
        return casosDesempaquetados
    }
}

