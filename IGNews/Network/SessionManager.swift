//
//  SessionManager.swift
//  IGNews
//
//  Created by subahan on 05/11/21.
//

import Foundation

class SessionManager: NetworkClientProtocol {
    private let session = URLSession(configuration: .default)
    func startService(service: Service, reponseObject: @escaping ServiceResponse) {
        guard let sessionURL = URL(string: service.baseUrl + service.requestUrl) else { return }
        let dataTask = session.dataTask(with: sessionURL) { (data, response, error) in
            if let data = data, error == nil {
                if let parser = service.parser {
                    let reponseModel = parser.parse(data)
                    let object = ReponseObject(statusCode: 0, data: reponseModel)
                    DispatchQueue.main.async {
                        reponseObject(error, object)
                    }
                    return
                }
            }
            else {
                print("error in data task is \(String(describing: error))")
            }
            DispatchQueue.main.async {
                reponseObject(error, ReponseObject(statusCode: 0, data: data))
            }
        }
        dataTask.resume()
    }
}
