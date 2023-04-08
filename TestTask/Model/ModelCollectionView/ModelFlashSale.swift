//
//  ModelFlashSale.swift
//  TestTask
//
//  Created by Sergio on 7.04.23.
//

import Foundation

// https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac

// MARK: - Welcome
struct ModelFlashSale: Codable {
    let flashSale: [FlashSale]

    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

// MARK: - FlashSale
struct FlashSale: Codable {
    let category, name: String?
    let price: Double?
    let discount: Int?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageURL = "image_url"
    }
}
