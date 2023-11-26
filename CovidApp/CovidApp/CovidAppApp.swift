//
//  CovidAppApp.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import SwiftUI

@main
struct CovidAppApp: App {
    @Environment(\.scenePhase) var scenePhase
        
        var body: some Scene {
            WindowGroup {
                DetailView()
            }.onChange(of: scenePhase) { (newScenePhase) in
                switch newScenePhase {
                case .background:
                    print("App State: Background")
                case .inactive:
                    print("App State: Inactive")
                case . active: //Foreground
                    print("App State: Active")
                @unknown default:
                    print("App State: Unknown")
                }
            }
        }
    }
