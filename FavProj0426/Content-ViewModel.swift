//
//  Content-ViewModel.swift
//  FavProj0426
//
//  Created by 张亚飞 on 2022/4/26.
//

import Foundation
import SwiftUI

extension ContentView {
    
    final class ViewModel: ObservableObject {
        
        @Published var items = [Item]()
        @Published var showingFavs = false
        @Published var savedItems: Set<Int> = [1, 7]
        
        var filterdItems: [Item] {
            
            if showingFavs {
                
                return items.filter { savedItems.contains($0.id) }
            } else {
                
                return items
            }
        }
        
        private var db = Database()
        
        init() {
            self.savedItems = db.load()
            self.items = Item.simplaItems
        }
        
        func sortFavs() {
            withAnimation {
                showingFavs.toggle()
            }
        }
        
        func contains(_ item: Item) -> Bool {
            savedItems.contains(item.id)
        }
        
        func toggleFav(item: Item) {
            if contains(item) {
                savedItems.remove(item.id)
            } else {
                savedItems.insert(item.id)
            }
            db.save(items: savedItems)
        }
    }
}
