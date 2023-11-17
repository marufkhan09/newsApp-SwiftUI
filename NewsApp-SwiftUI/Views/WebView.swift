//
//  WebView.swift
//  NewsApp-SwiftUI
//
//  Created by Maruf Khan on 17/11/23.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    let urlString : String?
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
    
}

#Preview {
    WebView(urlString: "https://chat.openai.com/")
}
