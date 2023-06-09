import UIKit

extension UILabel {
    convenience init(textAlignment: NSTextAlignment = .left, text: String, font: UIFont?, textColor: UIColor) {
        self.init()

        self.textAlignment = textAlignment
        self.text = text
        self.textColor = textColor
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
