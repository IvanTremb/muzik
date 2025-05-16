//
//  AllSongsViewModel.swift
//  Muzik
//
//  Created by Ivan Trembaci on 29.04.2025.
//

import SwiftUI
import UniformTypeIdentifiers

struct AddSongButton: View {
    
    @Bindable var vm: AllSongsViewModel
    
    var body: some View {
        Button {
            vm.fileImporterIsPresented.toggle()
        } label: {
            Image(systemName: "plus.circle")
                .foregroundStyle(.black)
        }
        .fileImporter(
            isPresented: $vm.fileImporterIsPresented,
            allowedContentTypes: [.mp3, .wav],
            allowsMultipleSelection: true) { result in
                switch result {
                case .success(let urls) :
                    for url in urls {
                        let accessGranted = url.startAccessingSecurityScopedResource()
                        
                        defer {
                            if accessGranted {
                                url.stopAccessingSecurityScopedResource()
                            }
                        }
                        do {
                            try vm.copyToDocuments(url: url)
                            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                            let localURL = documentsURL.appendingPathComponent(url.lastPathComponent)
                            let finalSong = vm.extractMetadata(url: localURL)
                            vm.allSongs.append(SongInfo(url: localURL, metadata: finalSong)) // сохраняем полный путь
                        } catch {
                            print("ошибка импорта")
                        }
                    }
                case .failure(let error): print(error)
                    
                }
            }
    }
}

#Preview {
    AddSongButton(vm: AllSongsViewModel())
}
