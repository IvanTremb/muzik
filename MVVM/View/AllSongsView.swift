//
//  ContentView.swift
//  Muzik
//
//  Created by Ivan Trembaci on 29.04.2025.
//

import SwiftUI
import AVFoundation

struct AllSongsView: View {
    
    @Bindable var vm: AllSongsViewModel
    
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
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()
                    
                List {
                    ForEach(vm.allSongs) { song in
                        SongRowView(vm: vm,
                                    songURL: song.url,
                                    trackName: song.metadata.title,
                                    artistName: song.metadata.artist,
                                    isPlaying: vm.isCurrentlyPlaying(song),
                                    isFav: song.isFav,
                                    SongInfo: song)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(.clear)
                .listStyle(.plain)
                
                .navigationTitle("All Songs")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    AddSongButton(vm: vm)
                }
            }
        }
    }
}

#Preview {
    AllSongsView(vm: AllSongsViewModel())
        .preferredColorScheme(.dark)
}
