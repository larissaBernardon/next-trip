//
//  ColorExtension.swift
//  NextTrip
//
//  Created by larissa.bernardon on 08/04/23.
//

import SwiftUI

extension Color {
    static let lightGray = Color(red: 222/255, green: 222/255, blue: 222/255)
    static let mediumGray = Color(red: 138/255, green: 138/255, blue: 138/255)
    static let darkGray = Color(red: 63/255, green: 63/255, blue: 63/255)
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        self.init(
            red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgbValue & 0x0000FF) / 255.0
        )
    }
}
