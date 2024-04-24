//
//  ColorFromHex.swift
//  MappingJSONBundle
//
//  Created by MACBOOK PRO on 24/04/24.
//

import Foundation
import SwiftUI

func colorFromHexString(_ hex:String) -> Color{
    //proses trimming, membuang spasi di awal dan akhir string, menjadikan uppercase
    let hex = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
    
    //validasi hex,
    //jumlahnya 6 digit tanpa alpha
    //7 digit termasuk prefix #
    guard hex.count == 6 || (hex.count == 7 && hex.hasPrefix("#")) else{
        return Color(red: 0, green: 0, blue: 0)
    }
    
    
    //konversi string hex ke swift color
    let hexColor = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
    
    //ekstrak komponen color ke dalam susunan rgb(RRGGBB)
    let redColor = hexColor.prefix(2)
    let greenColor = hexColor.dropFirst(2).prefix(2)
    let blueColor = hexColor.suffix(2)
    
    
    //1. konversi hex ke integer untuk validasi kembali, radix basis sistem bilangan matematika, a-z menjadi integer
    guard let r = UInt64(redColor, radix: 16),let g = UInt64(greenColor, radix: 16),let b = UInt64(blueColor, radix: 16)
    else {return Color(red: 0, green: 0, blue: 0)}
    let results = Color(red: Double(r)/255.0, green: Double(g)/255.0, blue: Double(b) / 255.0)
    return results
}
