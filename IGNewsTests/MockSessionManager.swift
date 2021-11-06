//
//  MockService.swift
//  IGNewsTests
//
//  Created by subahan on 06/11/21.
//

import Foundation
import IGNews

class MockSessionManager : NetworkClientProtocol {
    
    func responseFile(service: Service) -> String? {
        if service.requestUrl == Constants.articlesPath {
            return "NewsArticlesResponse"
        }
        return nil
    }
    
    func startService(service: Service, reponseObject: @escaping ServiceResponse) {
        if let url = Bundle.main.url(forResource: responseFile(service: service), withExtension: "json"),
            let data = try? Data(contentsOf: url){
            
            let json = service.parser?.parse(data)
            reponseObject(nil, ReponseObject(statusCode: 200, data: json))
        } else{
            reponseObject(nil, nil)
        }
           
    }
    
    
}
