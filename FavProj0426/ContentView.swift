//
//  ContentView.swift
//  FavProj0426
//
//  Created by 张亚飞 on 2022/4/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        
        VStack {
            
            Button("Toggle Favorites") {
                
                vm.sortFavs()
            }
            .padding()
            
            List {
                
                ForEach(vm.filterdItems) { item in
                    
                    HStack {
                       
                        VStack(alignment: .leading, spacing: 4, content: {
                            
                            Text(item.title)
                                .font(.headline)
                            
                            Text(item.descripption)
                                .font(.subheadline)
                        })
                        
                        Spacer()
                        
                        Image(systemName: vm.contains(item) ? "heart.fill" : "heart")
                            .foregroundColor(vm.contains(item) ? .red : .gray)
                            .onTapGesture {
                            
                                vm.toggleFav(item: item)
                            }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
