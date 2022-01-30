//
//  UIFontExtension.swift
//  Weatherity
//
//  Created by Harsh on 29/01/2022.
//

import UIKit

enum FontNames: String {
    case NunitoSansBlack = "NunitoSans-Black"
    case NunitoSansBold = "NunitoSans-Bold"
    case NunitoSansExtraBold = "NunitoSans-ExtraBold"
    case NunitoSansLight = "NunitoSans-Light"
    case NunitoSansRegular = "NunitoSans-Regular"
    case NunitoSansSemiBold = "NunitoSans-SemiBold"
}

extension UIFont {
    
    //MARK: global fonts
    static let nunitoSansBlack16 = UIFont(name: FontNames.NunitoSansBlack.rawValue, size: 16) ?? UIFont.systemFont(ofSize: 16)
}
