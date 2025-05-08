//
//  SongModel.swift
//  Muzik
//
//  Created by Ivan Trembaci on 03.05.2025.
//

import Foundation
import UIKit

//struct SongMetadata {
//    var title: String?
//    var artist: String?
//    var artwork: UIImage?
//    var duration: Double
//}
//
//struct SongInfo: Identifiable {
//    let id = UUID()
//    let url: URL
//    var isFav = false
//    let metadata: SongMetadata
//}

struct SongMetadata: Codable {
    var title: String?
    var artist: String?
    var artworkData: Data?    // UIImage нельзя кодировать напрямую
    var duration: Double

    var artwork: UIImage? {
        artworkData.flatMap { UIImage(data: $0) }
    }

    init(title: String?, artist: String?, artwork: UIImage?, duration: Double) {
        self.title = title
        self.artist = artist
        self.artworkData = artwork?.pngData()
        self.duration = duration
    }
}

struct SongInfo: Identifiable, Codable {
    let id: UUID
    let url: URL
    var isFav: Bool
    let metadata: SongMetadata

    init(url: URL, metadata: SongMetadata, isFav: Bool = false) {
        self.id = UUID()
        self.url = url
        self.metadata = metadata
        self.isFav = isFav
    }
}
