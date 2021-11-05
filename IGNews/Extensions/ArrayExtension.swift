//
//  ArrayExtension.swift
//  IGNews
//
//  Created by subahan on 05/11/21.
//

import Foundation

extension Array {
    func object(at index: Int) -> Element? {
        guard index < self.count, index >= 0 else { return nil }
        return self[index]
    }
}
