//
//  AllSongsListView.swift
//  Muzik
//
//  Created by Ivan Trembaci on 01.05.2025.
//

import SwiftUI

struct AllSongsListView: View {
    
    @Bindable var vm: AllSongsViewModel
    
    var body: some View {
        ScrollView {
            ForEach(vm.allSongs) { song in
                SongRowView(vm: vm,
                            songURL: song.url,
                            trackName: song.metadata.title,
                            artistName: song.metadata.artist,
                            isPlaying: vm.isCurrentlyPlaying(song),
                            isFav: song.isFav,
                            SongInfo: song)
            }
            .padding(.horizontal)
            .onAppear{
                print("List is appearing")
//                vm.loadFromDocuments()
//                vm.loadFavorites()
            }
        }
    }
}

#Preview {
    AllSongsListView(vm: AllSongsViewModel())
}
