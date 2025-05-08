//
//  SwiftUIView.swift
//  Muzik
//
//  Created by Ivan Trembaci on 03.05.2025.
//
//this is a dev branch

import SwiftUI

struct SongRowView: View {
    
    var vm: AllSongsViewModel
    var songURL: URL
    var trackName: String?
    var artistName: String?
    var isPlaying: Bool
    var isFav: Bool
    var SongInfo: SongInfo
    @State private var animateHeart = false
    
    var body: some View {
        Rectangle()
            .frame(width: UIScreen.main.bounds.width - 10, height: 65)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay{
                HStack(spacing: 15) {
                    Button {
                        vm.play(url: songURL)
                    } label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(.white)
                    }
                    VStack(alignment: .leading) {
                        Text(trackName ?? "unknown" )
                            .font(.title)
                            .foregroundStyle(.white)
                            .fontDesign(.rounded)
                        Text(artistName ?? "unknown")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .fontDesign(.rounded)
                    }
                    
                    Spacer()
                    
                    Button {
                        vm.toggleFavorite(song: SongInfo)
                        vm.haptic()
                        withAnimation(.easeInOut(duration: 0.3)) {
                            animateHeart.toggle()
                        }
                    } label: {
                        Image(systemName: isFav ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundStyle( isFav ? .red : .white)
                }
            }
                .padding()
        }
    }
}

//#Preview {
//    SwiftUIView(vm: AllSongsViewModel())
//}
