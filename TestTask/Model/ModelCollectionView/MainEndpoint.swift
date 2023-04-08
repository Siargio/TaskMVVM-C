//
//  Manager.swift
//  TestTask
//
//  Created by Sergio on 7.04.23.
//

import Foundation

enum MainEndpoint: EndpointProtocol {
    case queryLatest
    case queryFlashSale

    var scheme: String { return "https://" }

    var host: String { return "run.mocky.io" }

    var method: RequestMethod { return .GET }

    var path: String { return "/v3/" }

    var query: String {
        switch self {
        case .queryLatest:
            return "cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        case .queryFlashSale:
            return "a9ceeb6e-416d-4352-bde6-2203416576ac"
        }
    }
}
