//
//  Service.swift
//  IGNews
//
//  Created by subahan on 05/11/21.
//

import Foundation

public enum RequestType: String {
    case GET
}

public typealias ServiceResponse = (_ error: Error?, _ reponseObject: ReponseObject?) -> Void

public struct ReponseObject {
    var statusCode: Int
    var data: Any?
}

public protocol Service {
    var baseUrl: String { get }
    var requestUrl: String { get }
    var requestType: RequestType { get }
}
