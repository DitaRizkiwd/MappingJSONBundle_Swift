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
                    HStack(spacing: 16){
                        item.uiImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding()
                            .background(item.uiColor)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        Text(item.name)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            .navigationTitle("Color")
        }
    }
}

#Preview {
    ContentView()
}
