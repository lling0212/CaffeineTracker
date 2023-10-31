//
//  Extensions.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/31.
//

import Foundation

// understand details of Encodable

extension Encodable {
    func asDictionary() -> [String: Any] {
        
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with:
                       data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
        
    }
}
