//
//  UITextField+Ext.swift
//  TestTask
//
//  Created by Sergio on 13.03.23.
//

import UIKit

extension UITextField {
    convenience init(placeholder: String) {
        self.init()

        self.backgroundColor = CommonColor.customGray
        self.textAlignment = .center
        self.layer.cornerRadius = 17
        self.translatesAutoresizingMaskIntoConstraints = false

        let attributes = [
            NSAttributedString.Key.foregroundColor: CommonColor.customGrayTex,
            NSAttributedString.Key.font : UIFont(name: "Montserrat-Light", size: 12)!
        ]

        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes:attributes)
    }

    func setLeftPaddingPoints(_ amount: CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }else{
            button.setImage(UIImage(systemName: "eye"), for: .normal)
        }
    }

    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        button.tintColor = CommonColor.customGrayTex
        self.rightView = button
        self.rightViewMode = .always
    }

    @objc func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as? UIButton ?? UIButton(type: .system))
    }
}
