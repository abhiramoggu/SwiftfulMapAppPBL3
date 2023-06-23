//
//  LocationMapAnnotationView.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/06/22.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        ZStack{
            Image(systemName: "circle.fill")
                .resizable()
                .scaledToFit()
                .offset(y: -8)
                .foregroundColor(accentColor.opacity(0.4))
                .frame(width:100, height: 100)
            
            VStack(spacing: 0){
                Image(systemName: "map.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:30, height:30)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(6)
                    .background(accentColor)
                    .cornerRadius(36)
                
                Image(systemName: "triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(accentColor)
                    .frame(width: 10, height:10)
                    .rotationEffect(Angle(degrees: 180))
                    .offset(y: -4)
                    .padding(.bottom, 40)
                
            }
            //.background(Color.blue)
            //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            LocationMapAnnotationView()
        }
       
    }
}
