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
                ZStack {
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .white, location: 0.0),
                            .init(color: .blue.opacity(0.7), location: 0.3),
                            .init(color: .red.opacity(0.8), location: 0.7),
                            .init(color: .black.opacity(0.5), location: 1.0)
                        ]),
                        startPoint: .top,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()
                    VStack {
                        PlayListRowView(vm: vm)
                        List {
                            Text("Favorutes")
                        }
                        .scrollContentBackground(.hidden)
                        .background(.clear)
                        .listStyle(.plain)
                        .navigationTitle("Playlists")
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
        }
    }


#Preview {
    PlayListsView(vm: AllSongsViewModel())
}
