//
//  DetailView.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//
import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel = StartViewModel()
    @State private var showData = false

    var body: some View {
        VStack {
            if showData {
                Text(viewModel.casosDesempaquetados.description)
            } else {
                Text("Esperando datos...")
                    .onAppear {
                        // Introduce un retraso de 3 segundos antes de mostrar los datos
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            showData = true
                            Task{
                                await viewModel.procesarDatos()
                            }
                        }
                    }
            }
        }
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Crea una instancia de DetailViewModel y pásala a la vista previa
        DetailView()
    }
}

