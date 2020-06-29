//
//  Extensions+UIColor.swift
//  ToyProject@Crecker
//
//  Created by elesahich on 2020/05/27.
//  Copyright © 2020 elesahich. All rights reserved.
//
import UIKit

enum AssetsColor {
    // Button Color
    case black60
    case mainColor
    case orangeColor
    case signUpAndInColor
    case soptColor
}

extension UIColor {

  @nonobjc class var mainBlue: UIColor {
    return UIColor(red: 76.0 / 255.0, green: 154.0 / 255.0, blue: 1.0, alpha: 1.0)
  }

  @nonobjc class var subBlue: UIColor {
    return UIColor(red: 179.0 / 255.0, green: 212.0 / 255.0, blue: 1.0, alpha: 1.0)
  }

  @nonobjc class var lightBlue: UIColor {
    return UIColor(red: 236.0 / 255.0, green: 244.0 / 255.0, blue: 1.0, alpha: 1.0)
  }

  @nonobjc class var black100: UIColor {
    return UIColor(white: 42.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var black80: UIColor {
    return UIColor(white: 67.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var black60: UIColor {
    return UIColor(white: 134.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var black40: UIColor {
    return UIColor(red: 197.0 / 255.0, green: 199.0 / 255.0, blue: 202.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var black20: UIColor {
    return UIColor(white: 219.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var lightGray: UIColor {
    return UIColor(white: 243.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var white: UIColor {
    return UIColor(white: 1.0, alpha: 1.0)
  }

  @nonobjc class var redBackground: UIColor {
    return UIColor(red: 1.0, green: 241.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var lightMint: UIColor {
    return UIColor(red: 231.0 / 255.0, green: 1.0, blue: 251.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var skyblue: UIColor {
    return UIColor(red: 182.0 / 255.0, green: 248.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var deepSky: UIColor {
    return UIColor(red: 145.0 / 255.0, green: 237.0 / 255.0, blue: 243.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var red: UIColor {
    return UIColor(red: 1.0, green: 61.0 / 255.0, blue: 61.0 / 255.0, alpha: 1.0)
  }

}
