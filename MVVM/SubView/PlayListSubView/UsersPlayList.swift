//
//  UsersPlayList.swift
//  Muzik
//
//  Created by Ivan Trembaci on 11.05.2025.
//

import SwiftUI

struct UsersPlayList: View {
    
    //@Bindable var vm = PlayListsViewModel()
    
    var playListName: String
    var listOfSongs: [SongInfo]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white.opacity(0.3), lineWidth: 0.5)
                
            HStack {
                Image(systemName: "music.note")
                    .foregroundStyle(.red.gradient)
                    .font(.system(size: 33))

                VStack(alignment: .leading) {
                    Text("\(playListName)")
                        .foregroundStyle(.black)
                    Text("Tracks: \(listOfSongs.count)")
                        .font(.caption)
                        .foregroundStyle(.black)
                }
                Spacer()
            }
            .padding()
        }
        .frame(height: 70)
        .background(.ultraThinMaterial)
        .cornerRadius(12)

    }
}

//#Preview {
//    UsersPlayList(listInfo: vm.playListsDict)
//}
