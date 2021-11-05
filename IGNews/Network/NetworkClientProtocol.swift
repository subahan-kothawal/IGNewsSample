//
//  NetworkClientProtocol.swift
//  IGNews
//
//  Created by subahan on 05/11/21.
//

import Foundation

public protocol NetworkClientProtocol {
    func startService(service: Service, reponseObject: @escaping ServiceResponse)
}
