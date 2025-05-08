//
//  File.swift
//  Muzik
//
//  Created by Ivan Trembaci on 29.04.2025.
//

import Foundation
import UniformTypeIdentifiers
import AVFoundation
import UIKit


@Observable
class AllSongsViewModel {
    init(){
        prepareAudioSession()
        loadFromDocuments()
        loadFavorites()
    }
    
    var player: AVPlayer?
    var fileImporterIsPresented = false
    var allSongs: [SongInfo] = []
    var favoriteSongs: [SongInfo] {
        allSongs.filter { $0.isFav }
    }
    
    var currentPlayingSong: SongInfo? = nil
    var isPlaying = false
    
    let hapticLight = UIImpactFeedbackGenerator(style: .light)
    let hapticHeavy = UIImpactFeedbackGenerator(style: .heavy)
    
    func copyToDocuments(url: URL) throws {
            let fileManager = FileManager.default
            let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
            let destinationURL = documentsURL.appendingPathComponent(url.lastPathComponent)
            if fileManager.fileExists(atPath: destinationURL.path) {
                try fileManager.removeItem(at: destinationURL)
            }
        do {
            try fileManager.copyItem(at: url, to: destinationURL)
        } catch {
            print(error)
        }
            print("\(url.lastPathComponent) copy to \(destinationURL)")
        }
    
    func extractMetadata(url: URL) -> SongMetadata {
        let asset = AVAsset(url: url)

        var title: String?
        var artist: String?
        var artwork: UIImage?

        for format in asset.commonMetadata {
            if format.commonKey?.rawValue == "title" {
                title = format.stringValue
            } else if format.commonKey?.rawValue == "artist" {
                artist = format.stringValue
            } else if format.commonKey?.rawValue == "artwork",
                      let data = format.dataValue,
                      let image = UIImage(data: data) {
                artwork = image
            }
        }

        let duration = CMTimeGetSeconds(asset.duration)

        return SongMetadata(
            title: title,
            artist: artist,
            artwork: artwork,
            duration: duration
        )
    }

    
//    func loadFromDocuments() {
//            let fileManager = FileManager.default
//            if let docURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
//                do {
//                    let urls = try fileManager.contentsOfDirectory(at: docURL, includingPropertiesForKeys: nil)
//                    allSongs = urls.filter {
//                        ["mp3", "m4a", "aac", "wav"].contains($0.pathExtension.lowercased())
//                    }
//                } catch {
//                    print("Load error: \(error)")
//                }
//            }
//        }
    
    func loadFromDocuments() {
        let fileManager = FileManager.default
        if let docURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            do {
                let urls = try fileManager.contentsOfDirectory(at: docURL, includingPropertiesForKeys: nil)
                let audioURLs = urls.filter {
                    ["mp3", "m4a", "aac", "wav"].contains($0.pathExtension.lowercased())
                }

                // Заполняем массив SongInfo
                allSongs = audioURLs.map { url in
                    let metadata = extractMetadata(url: url)
                    return SongInfo(url: url, metadata: metadata)
                }

            } catch {
                print("Load error: \(error)")
            }
        }
    }
    
    func play(url: URL) {
        if let current = currentPlayingSong {
            if current.url == url {
                if isPlaying {
                    pause()
                } else {
                    player?.play()
                    isPlaying = true
                }
                return
            }
        }
        
        player = AVPlayer(url: url)
        player?.play()
        isPlaying = true
        print("Now is playing: \(url.lastPathComponent)")
        print(allSongs.first(where: {$0.url == url})?.id ?? "ut")
        currentPlayingSong = allSongs.first(where: {$0.url == url})
    }
    
    func pause() {
        player?.pause()
        isPlaying = false
    }
    
    func stop() {
        player?.pause()
        player = nil
        currentPlayingSong = nil
        isPlaying = false
    }
    
//    func addToFav(song: SongInfo) {
//        var tempSong = allSongs.first(where: {$0.id == song.id})
//        tempSong?.isFave.toggle()
//    }
    
    func isCurrentlyPlaying(_ song: SongInfo) -> Bool {
        return currentPlayingSong?.id == song.id && isPlaying
    }
    
    func prepareAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("AudioSession error: \(error)")
        }
    }
    
    func toggleFavorite(for song: SongInfo) {
        if let index = allSongs.firstIndex(where: { $0.id == song.id }) {
            allSongs[index].isFav.toggle()
            saveFavorites()
        }
    }
    
    func saveFavorites() {
        do {
            let data = try JSONEncoder().encode(allSongs)
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("songs.json")
            try data.write(to: url)
        } catch {
            print("Ошибка сохранения избранного: \(error)")
        }
    }

    func loadFavorites() {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("songs.json")
        guard FileManager.default.fileExists(atPath: url.path) else { return }

        do {
            let data = try Data(contentsOf: url)
            allSongs = try JSONDecoder().decode([SongInfo].self, from: data)
        } catch {
            print("Ошибка загрузки избранного: \(error)")
        }
    }
    
    func toggleFavorite(song: SongInfo) {
        guard let index = allSongs.firstIndex(where: { $0.id == song.id }) else { return }
        allSongs[index].isFav.toggle()
        saveFavorites() // если хочешь сохранить это между сессиями
    }
    
    func haptic() {
        hapticLight.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.hapticHeavy.impactOccurred()
            }
    }
    
}
