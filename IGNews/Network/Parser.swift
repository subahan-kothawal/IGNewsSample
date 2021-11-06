//
//  Parser.swift
//  IGNews
//
//  Created by subahan on 06/11/21.
//

import Foundation

public protocol ResponseParser {
    func parse(_ data: Data) -> Any?
}

public class GenericParser<T: Decodable> : ResponseParser {
    public func parse(_ data: Data) -> Any? {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
        } catch {
            print("error while parsing data \(error)")
            return error
        }
    }
    
}
