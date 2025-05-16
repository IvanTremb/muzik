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
    @Bindable var PlayListsVM = PlayListsViewModel()
    var body: some Scene {
        WindowGroup {
            MainView(vm: vm, PlayListsVM: PlayListsVM)
                .preferredColorScheme(.dark)
        }
    }
}
