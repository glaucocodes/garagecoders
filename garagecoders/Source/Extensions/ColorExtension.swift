//
//  ColorExtension.swift
//  garagecoders
//
//  Created by Glauco Valdes on 9/4/19.
//  Copyright © 2019 Glauco Valdes. All rights reserved.
//

import UIKit
extension UIColor {
    public convenience init?(hex: String) {
        
        var hexToProcess = hex
        
        let r, g, b, a: CGFloat
        
        if(hex.count == 7){
            hexToProcess = hexToProcess + "FF"
        }
        
        if hexToProcess.hasPrefix("#") {
            let start = hexToProcess.index(hexToProcess.startIndex, offsetBy: 1)
            let hexColor = String(hexToProcess[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
