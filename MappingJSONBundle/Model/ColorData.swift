//
//  ColorData.swift
//  MappingJSONBundle
//
//  Created by MACBOOK PRO on 24/04/24.
//

import Foundation
import SwiftUI
struct ColorData :Codable, Identifiable{
    var id : Int
    var name: String
    var color : String
    var image: String
    
    
    //untuk handle apabila asset gambar tidak terdapat di sfsymbol
    var uiImage: Image{
        Image(systemName: image)
    }
    
    var uiColor : Color{
        colorFromHexString(color)
    }
    
    
}

//Mark: - MOCK DATA
extension ColorData{
    static func loadColorData() -> [ColorData]{
        guard let url = Bundle.main.url(forResource: "Colors", withExtension: "json"), let data = try? Data(contentsOf: url)
        else{fatalError("Failed to load JSON data from bundle")}
        do {
            let decodedColor = try JSONDecoder().decode([ColorData].self, from: data)
            return decodedColor
        }
        catch{
            fatalError("Failed to decoded JSON data from bundle\(error.localizedDescription)")
        }
    }
}
