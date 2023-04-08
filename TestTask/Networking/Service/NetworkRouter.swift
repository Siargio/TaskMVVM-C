//
//  NetworkRouter.swift
//  TestTask
//
//  Created by Sergio on 7.04.23.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointType
    func request(_router: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
