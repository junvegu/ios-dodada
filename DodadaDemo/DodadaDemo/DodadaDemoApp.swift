//
//  DodadaDemoApp.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 28/03/24.
//

import SwiftUI
import Dodada
@main
struct DodadaDemoApp: App {
    init() {
        Dodada.registerFonts()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
