//
//  PlayListsViewModel.swift
//  Muzik
//
//  Created by Ivan Trembaci on 06.05.2025.
//

import Foundation


@Observable
class PlayListsViewModel {
    init(){}
    
    var allPlayLists = [Playlist]()
    
    func addPlayList(name: String) {
        var tempName = name
        
        if tempName.isEmpty {
            tempName = "New Playlist"
        }
        allPlayLists.append(Playlist(name: tempName))
    }
    
}
