//
//  BaseService.swift
//  IGNews
//
//  Created by subahan on 05/11/21.
//

import Foundation
import UIKit

class BaseService: Service {
    var baseUrl: String
    var requestUrl: String
    var requestType: RequestType
    
    init() {
        baseUrl = Constants.baseUrl
        requestUrl = ""
        requestType = .GET
    }
}
