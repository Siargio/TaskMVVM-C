import Foundation

// https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7

// MARK: - Welcome
struct ModelLatest: Codable {
    let latest: [Latest]
}

// MARK: - Latest
struct Latest: Codable {
    let category, name: String?
    let price: Int?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}
