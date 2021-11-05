//
//  NetworkManager.swift
//  IGNews
//
//  Created by subahan on 05/11/21.
//

import Foundation

class NetworkManager {

    private static var instance: NetworkClientProtocol?
    private static var sessionManager = SessionManager()
    public static func shared(_ mockInstance: NetworkClientProtocol? = nil) -> NetworkClientProtocol {
        if let mockInstance = mockInstance {
            instance = mockInstance
            return mockInstance
        }
        guard let instance = NetworkManager.instance else {
            NetworkManager.instance = sessionManager
            return sessionManager
        }
        return instance
    }
    
}
