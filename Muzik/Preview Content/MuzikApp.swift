//
//  MuzikApp.swift
//  Muzik
//
//  Created by Ivan Trembaci on 29.04.2025.
//

import SwiftUI

@main
struct MuzikApp: App {
    @Bindable var vm = AllSongsViewModel()
    var body: some Scene {
        WindowGroup {
            MainView(vm: vm)
                .preferredColorScheme(.dark)
        }
    }
}
