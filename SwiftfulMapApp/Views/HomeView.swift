import SwiftUI
import WebKit

struct HomeView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    @State private var goBack = false // Add state for going back
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                WebView(request: URLRequest(url: Bundle.main.url(forResource: "Weather", withExtension: "html")!))
                    .frame(width: 360, height: 540) // Adjust the size of the WebView
                    .background(Color.yellow)
                    .navigationBarTitle("Home", displayMode: .inline)
                
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
                
                Spacer()
            }
            .background(Color.white)
            .navigationBarHidden(true) // Hide the navigation bar
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
