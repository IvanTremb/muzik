//
//  AddToPlaylist.swift
//  Muzik
//
//  Created by Ivan Trembaci on 15.05.2025.
//

import SwiftUI

struct PlaylistPickerView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var PlayListsVM: PlayListsViewModel
    let songsToAdd: [SongInfo]

    var body: some View {
        NavigationStack {
            List {
                ForEach(PlayListsVM.allPlayLists) { playlist in
                    Button(playlist.name) {
                        PlayListsVM.addSongsToPlaylist(songsToAdd, to: playlist)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Choose playlist")
        }
    }
}
