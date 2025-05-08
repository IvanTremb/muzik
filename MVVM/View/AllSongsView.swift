//
//  ContentView.swift
//  Muzik
//
//  Created by Ivan Trembaci on 29.04.2025.
//

import SwiftUI
import AVFoundation

struct AllSongsView: View {
    
    @Bindable var vm: AllSongsViewModel
    
    var body: some View {
        
        NavigationStack {
            AllSongsListView(vm: vm)
                .navigationTitle("All Songs")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    AddSongButton(vm: vm)
                }
        }
    }
}

#Preview {
    AllSongsView(vm: AllSongsViewModel())
        .preferredColorScheme(.dark)
}
