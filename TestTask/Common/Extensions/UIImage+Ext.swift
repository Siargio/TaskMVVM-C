import UIKit

extension UIImageView {
    convenience init(image: String) {
        self.init()

        let image = UIImage(named: image)
        self.image = image
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func setRounded() {
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.systemGray.cgColor
        self.layer.borderWidth = 1
    }
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,
                  let image = UIImage(data: data) else { return }

            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }
        .resume()
    }
}
