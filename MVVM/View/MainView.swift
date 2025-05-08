//
//  MainView.swift
//  Muzik
//
//  Created by Ivan Trembaci on 29.04.2025.
//

import SwiftUI

struct MainView: View {
    @Bindable var vm: AllSongsViewModel
    
    var body: some View {
        TabView {
            Tab("All", systemImage: "music.note") {
                AllSongsView(vm: vm)
            }
            Tab("PlayLists", systemImage: "music.note.list") {
                PlayListsView(vm: vm)
            }
        }
    }
}


//#Preview {
//    MainView()
//}
