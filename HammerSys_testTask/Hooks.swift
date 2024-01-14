//
//  Hooks.swift
//  HammerSys_testTask
//
//  Created by Sergei Kornilov on 14/01/2024.
//

import UIKit

// MARK: - UIView ext
public extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}


// Расширение для использования custom цветов RGB
extension UIColor {
    static let cRed = UIColor(red: 253.0/255.0, green: 58.0/255.0, blue: 105.0/255.0, alpha: 1.0)
    static let cRedAlpha20 = UIColor(red: 253.0/255.0, green: 58.0/255.0, blue: 105.0/255.0, alpha: 0.2)
    static let cRedAlpha40 = UIColor(red: 253.0/255.0, green: 58.0/255.0, blue: 105.0/255.0, alpha: 0.4)
    static let cDarkGrey = UIColor(red: 34.0/255.0, green: 40.0/255.0, blue: 49.0/255.0, alpha: 1.0)
    static let cMediumGrey = UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 173.0/255.0, alpha: 1.0)
    static let cLightGrey = UIColor(red: 195.0/255.0, green: 196.0/255.0, blue: 201.0/255.0, alpha: 1.0)
    static let cMoreLightGrey = UIColor(red: 243.0/255.0, green: 245.0/255.0, blue: 249.0/255.0, alpha: 1.0)
}


