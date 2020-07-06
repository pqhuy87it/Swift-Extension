//
//  NSDictionary+Extension.swift
//  N3Vocabulary
//
//  Created by Huy Pham Quang on 3/14/20.
//  Copyright © 2020 Huy Pham Quang. All rights reserved.
//

import Foundation

extension NSDictionary{
    func JsonString() -> String {
        do {
            let jsonData: Data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)

            guard let convertedString = String.init(data: jsonData, encoding: .utf8) else {
                return ""
            }

            return convertedString
        } catch {
            return "error converting"
        }
    }
}
