//
//  MainView.swift
//  Muzik
//
//  Created by Ivan Trembaci on 29.04.2025.
//

import SwiftUI

struct MainView: View {
    @Bindable var vm: AllSongsViewModel
    @Bindable var PlayListsVM: PlayListsViewModel
    var body: some View {
        TabView {
            Tab("All", systemImage: "music.note") {
                AllSongsView(vm: vm, PlayListsVM: PlayListsVM)
            }
            Tab("PlayLists", systemImage: "music.note.list") {
                PlayListsView(vm: vm, PlayListsVM: PlayListsVM)
            }
        }
    }
}


#Preview {
    MainView(vm: AllSongsViewModel(), PlayListsVM: PlayListsViewModel())
}
