//
//  EndpointProtocol.swift
//  TestTask
//
//  Created by Sergio on 7.04.23.
//

import Foundation

protocol EndpointProtocol {
    var scheme: String { get }
    var host: String { get }
    var method: RequestMethod { get }
    var path: String { get }
    var query: String { get }
}

enum RequestMethod: String {
    case GET
    case PUT
    case POST
    case DELETE
}
