//
//  ContentView.swift
//  MappingJSONBundle
//
//  Created by MACBOOK PRO on 24/04/24.
//

import SwiftUI

struct ContentView: View {
    let colordata = ColorData.loadColorData()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(colordata) { item in
                    ExtractedView(data: item)
                }
            }
            .navigationTitle("Color")
        }
    }
}

#Preview {
    ContentView()
}

struct ExtractedView: View {
    var data : ColorData
    var body: some View {
        HStack(spacing: 16){
            data.uiImage
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
                .background(data.uiColor)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Text(data.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
    }
}
