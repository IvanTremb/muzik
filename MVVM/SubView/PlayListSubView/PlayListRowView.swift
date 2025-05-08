//
//  PlayListRowView.swift
//  Muzik
//
//  Created by Ivan Trembaci on 07.05.2025.
//

import SwiftUI

struct PlayListRowView: View {
    
    var vm: AllSongsViewModel
    
    var body: some View {
        Button {
            
        } label: {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 10, height: 65)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay{
                    HStack {
                        Image("favPlaylist")
                        
                        VStack(alignment: .leading) {
                            Text("Favorites")
                                .font(.title)
                                .foregroundStyle(.white)
                                .fontDesign(.rounded)
                            Text("Songs: \(vm.favoriteSongs.count)")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .fontDesign(.rounded)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            
        }

    }
}

#Preview {
    PlayListRowView(vm: AllSongsViewModel())
}
