//
//  Extensions.swift
//  ToDo
//
//  Created by Sahil Gupta on 23/03/25.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            print("Error encoding or serializing object: \(error)")
            return [:]
        }
    }
}
