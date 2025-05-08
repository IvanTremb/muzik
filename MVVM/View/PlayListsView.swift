//
//  PlayListsView.swift
//  Muzik
//
//  Created by Ivan Trembaci on 29.04.2025.
//

import SwiftUI

struct PlayListsView: View {
    
    var vm: AllSongsViewModel
    
    var body: some View {
            NavigationStack {
                List {
                    Text("Favorutes")
                }
                .navigationTitle("Playlists")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }


#Preview {
    PlayListsView(vm: AllSongsViewModel())
}
