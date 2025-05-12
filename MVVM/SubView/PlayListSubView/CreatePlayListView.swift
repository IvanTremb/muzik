//
//  CreatePlayListView.swift
//  Muzik
//
//  Created by Ivan Trembaci on 12.05.2025.
//

import SwiftUI

struct CreatePlayListView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Bindable var vm: PlayListsViewModel
    @State var playListName = ""
    
    var body: some View {
        

            NavigationStack {
                VStack {
                    TextField("Enter PlayList`s name", text: $playListName)
                        .textFieldStyle(.roundedBorder)
                        .background(.gray.gradient)
                        .padding()
                    Spacer()
                }
                    .navigationTitle("Add PlayList")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        Button {
                            vm.addPlayList(name: playListName)
                            dismiss()
                        } label: {
                            Text("Create")
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background (
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: .white, location: 0.0),
                                .init(color: .blue.opacity(0.7), location: 0.3),
                                .init(color: .red.opacity(0.8), location: 0.7),
                                .init(color: .black.opacity(0.5), location: 1.0)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .ignoresSafeArea()
                        
                    )
            
        }
    }
}

#Preview {
    CreatePlayListView(vm: PlayListsViewModel())
}
