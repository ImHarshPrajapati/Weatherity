//
//  UIFontExtension.swift
//  Farmd
//
//  Created by Tapan Patel on 10/9/18.
//  Copyright © 2018 Farmd Apps. All rights reserved.
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
    static let nunitoSansBlack = UIFont(name: FontNames.NunitoSansBlack.rawValue, size: 12) ?? UIFont.systemFont(ofSize: 12)
}
