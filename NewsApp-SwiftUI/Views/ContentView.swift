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
            if(networkManager.postsAvailable){
                List {
                    ForEach(networkManager.posts) { post in
                        NavigationLink {
                            DetailView(url: post.url)
                        } label: {
                            HStack {
                                Text("\(post.points!) ")
                                Text(post.title!)
                            }
                        }
                        
                        
                    }
                }.navigationTitle("News")
            }else {
                ProgressView().progressViewStyle(.circular).scaleEffect(1.5).navigationTitle("News")
                
            }
            
            
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



