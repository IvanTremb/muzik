//
//  PlayListModel.swift
//  Muzik
//
//  Created by Ivan Trembaci on 11.05.2025.
//

import Foundation



struct Playlist: Identifiable, Codable {
    var id = UUID()
    var name: String
    var songs = [SongInfo]()
}

var allPlayLists = [Playlist]()

//let songinfoplaylist = SongInfo(url: URL(string: "https://example.com/audio.mp3")!, metadata: SongMetadata(title: "qwe", artist: "asd", artwork: nil, duration: 25.9), isFav: true)






