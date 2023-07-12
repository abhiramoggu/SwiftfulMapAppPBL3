//
//  HomeView.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/06/22.
//
import SwiftUI
import WebKit

struct HomeView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    @State private var goBack = false // Add state for going back
    
    var body: some View {
        NavigationView {
            VStack (spacing: 500) {
                WebView(request: URLRequest(url: Bundle.main.url(forResource: "Weather", withExtension: "html")!))
                    .padding()
                    .background(Color.yellow)
                    .navigationBarTitle("Home", displayMode: .inline)
                
                Text("Home")
                    .font(.largeTitle)
                
                NavigationLink(destination: LocationsView()) {
                    Text("Fish Locations")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.blue)
                }
                
                NavigationLink(destination: LocationsView()) {
                    Text("Box Locations")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.blue)
                }
            }
            .navigationBarHidden(true) // Hide the navigation bar
            .padding()
            .background(Color.white)
            .edgesIgnoringSafeArea(.all) // Extend the content to the edges
        }
    }
}

struct WebView: UIViewRepresentable {
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}

    

    

    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
                .environmentObject(LocationsViewModel())
        }
    }
