//
//  PlayListsView.swift
//  Muzik
//
//  Created by Ivan Trembaci on 29.04.2025.
//

import SwiftUI

struct PlayListsView: View {
    
    var vm: AllSongsViewModel
    @Bindable var PlayListsVM = PlayListsViewModel()
    @State private var addPlatList = false
    
    var body: some View {
            NavigationStack {
                ZStack {
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .white, location: 0.0),
                            .init(color: .blue.opacity(0.7), location: 0.3),
                            .init(color: .red.opacity(0.8), location: 0.7),
                            .init(color: .black.opacity(0.5), location: 1.0)
                        ]),
                        startPoint: .top,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()
                    VStack {
                        PlayListRowView(vm: vm)
                        List {
                            ForEach(PlayListsVM.allPlayLists) { list in
                                UsersPlayList(playListName: list.name,
                                              listOfSongs: list.songs)
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            
                        }
                        .scrollContentBackground(.hidden)
                        .background(.clear)
                        .listStyle(.plain)
                        .navigationTitle("Playlists")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            Button {
                                addPlatList.toggle()
                            } label: {
                                Text("Add")
                                    .foregroundStyle(.black)
                                Image(systemName: "folder.badge.plus")
                                    .font(.system(size: 15))
                                    .foregroundStyle(.black)
                            }
                        }
                        .sheet(isPresented: $addPlatList) {
                            CreatePlayListView(vm: PlayListsVM, playListName: "")
                                .presentationDetents([.medium])
                        }
                    }
                }
            }
        }
    }


#Preview {
    PlayListsView(vm: AllSongsViewModel())
}
