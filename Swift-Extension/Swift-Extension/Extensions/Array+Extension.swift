
import Foundation
import UIKit

extension Array where Element: Equatable {
    @discardableResult
    mutating func remove(_ element: Element) -> Index? {
        guard let index = firstIndex(of: element) else { return nil }
        remove(at: index)
        return index
    }

    @discardableResult
    mutating func remove(_ elements: [Element]) -> [Index] {
        return elements.compactMap { remove($0) }
    }
}

/*
 let array = ["foo", "bar"]
 array.remove(element: "foo")
 array //=> ["bar"]
*/

public extension Collection {
    subscript(safe index: Index) -> Element? {
        return startIndex <= index && index < endIndex ? self[index] : nil
    }
}

/*
 let array = [0, 1, 2]
 if let item = array[safe: 5] {
     print(item)
 } else {
     print("unreachable")
 }
 */

extension Array {
    func chunked(by chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}

public extension Collection where Element: Hashable {
	func unified() -> [Element] {
		return reduce(into: []) {
			if !$0.contains($1) {
				$0.append($1)
			}
		}
	}
}
