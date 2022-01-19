//
//  Helper.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import UIKit


class RoundView: UIView {
    override func awakeFromNib() {
        setupView()
    }
    func setupView() {
        self.layer.cornerRadius =  8
    }
}

class RoundViewShadow: UIView {
    override func awakeFromNib() {
        setupView()
    }
    func setupView() {
        self.layer.cornerRadius =  8
//        self.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        self.layer.shadowRadius = 8
//        self.layer.shadowOpacity = 1
//        self.layer.shadowOffset = .zero
    }
}

class CircleBtn: UIButton {
    override func awakeFromNib() {
        setupView()
    }
    func setupView() {
        self.layer.cornerRadius =  self.frame.height / 2
    }
}

class RoundBtn: UIButton {
    override func awakeFromNib() {
        setupView()
    }
    func setupView() {
        self.layer.cornerRadius =  8
    }
}

class RoundBtnBorder: UIButton {
    override func awakeFromNib() {
        setupView()
    }
    func setupView() {
        self.layer.cornerRadius =  8
        self.layer.borderColor = #colorLiteral(red: 0, green: 0.4545738101, blue: 0.5298986435, alpha: 1)
        self.layer.borderWidth = 1
    }
}

class RoundBtn4: UIButton {
    override func awakeFromNib() {
        setupView()
    }
    func setupView() {
        self.layer.cornerRadius =  4 //self.frame.height / 2
    }
}

class RoundTxtF: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    override func awakeFromNib() {
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = 4
        self.layer.borderColor = #colorLiteral(red: 0.5618024468, green: 0.6101570725, blue: 0.6216071248, alpha: 1)
        self.layer.borderWidth = 1
    }

        override open func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
        override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
        override open func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

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
