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
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white.opacity(0.3), lineWidth: 0.5)
                
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red.gradient)
                    .font(.system(size: 33))

                VStack(alignment: .leading) {
                    Text("Favorites")
                        .foregroundStyle(.black)
                    Text("Tracks: \(vm.favoriteSongs.count)")
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

#Preview {
    PlayListRowView(vm: AllSongsViewModel())
}
