//
//  Collection+Extension.swift
//  Swift-Extension
//
//  Created by Pham Quang Huy on 2020/05/17.
//  Copyright © 2020 Huy Pham Quang. All rights reserved.
//

import Foundation
import UIKit

extension Collection where Index == Int {
    func chunked(by chunkSize: Int) -> [[Element]] {
        stride(from: startIndex, to: endIndex, by: chunkSize).map { Array(self[$0..<Swift.min($0 + chunkSize, count)]) }
    }
}
