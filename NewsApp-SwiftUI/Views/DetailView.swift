//
//  DetailView.swift
//  NewsApp-SwiftUI
//
//  Created by Maruf Khan on 17/11/23.
//

import SwiftUI

struct DetailView: View {
    let url : String?
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}



