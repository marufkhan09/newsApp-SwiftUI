//
//  ContentView.swift
//  NewsApp-SwiftUI
//
//  Created by Maruf Khan on 17/11/23.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationSplitView {
            List {
                ForEach(networkManager.posts) { post in
                    HStack {
                        Text("\(post.points!) ")
                        Text(post.title!)
                    }
                }
            }.navigationTitle("News")
        } detail: {
            Text("Select")
        }

        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

#Preview {
    ContentView()
}



