//
//  DetailView.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//
import SwiftUI

struct DetailView: View {
    @State var caseList = [CaseByDate]()

    var body: some View {
        Text("We're going on")
        List(caseList) { caseByDate in
            HStack {
              //  Text("\(caseByDate.cases)") // Acceder a la propiedad 'cases' del elemento
            }
        }
        .task {
            await getCaseByDate()
        }
    }

    func getCaseByDate() async {
        do {
            print("On DetailView")
            let repository = CasesRepository()
            if let result = try await repository.getCaseByDate(date:"2022-05-05") {
                caseList = [result]
                print(caseList)
                print(result)
            } else {
                caseList = []
                print("caseList Empty")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Crea una instancia de DetailViewModel y pásala a la vista previa
        DetailView()
    }
}

