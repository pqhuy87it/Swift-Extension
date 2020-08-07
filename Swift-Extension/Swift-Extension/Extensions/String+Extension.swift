
import Foundation
import UIKit

extension String {
    var containsFullWidthCharacters: Bool {
        return unicodeScalars.contains{ $0.isFullWidth }
    }
    
    func isNumber() -> Bool {
        let numberRegex = "^[0-9]*$"
        return NSPredicate(format: "SELF MATCHES %@", numberRegex).evaluate(with:self)
    }
    
    func transfromFullWidthToHalfWidth(reverse: Bool) -> String {
        let string = NSMutableString(string: self) as CFMutableString
        CFStringTransform(string, nil, kCFStringTransformFullwidthHalfwidth, reverse)
        return string as String
    }
    
    func trim() -> String{
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    static public func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map {
            _ in letters.randomElement()!
        })
    }
    
    public func subString(fromIndex: Int, toIndex: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: fromIndex)..<self.index(self.startIndex, offsetBy: toIndex)])
    }
    
    func formatAcountNumber() -> String {
        var endNumber = self.subString(fromIndex: 5, toIndex: self.count)
        
        var numberCharacter = 0
        
        if endNumber.count % 2 == 0 {
            numberCharacter = endNumber.count / 2
        } else {
            numberCharacter = endNumber.count / 2 +  1
        }
        
        let replaceString = (0..<numberCharacter).map{_ in "*"}.joined()
        let startIndex = endNumber.startIndex
        let range: Range = startIndex..<endNumber.index(startIndex, offsetBy: numberCharacter)
        endNumber = endNumber.replacingCharacters(in: range, with: replaceString)
        
        return "***** - \(endNumber)"
    }
    
    func formatAcountNumberShowAll() -> String {
        let endNumber = self.subString(fromIndex: 5, toIndex: self.count).formatTrimAccountNumber()
        let startNumber = self.subString(fromIndex: 0, toIndex: 5)
        
        return "\(startNumber) - \(endNumber)"
    }
    
    func formatTrimAccountNumber() -> String {
        var valueEndNumber:String = ""
        for (i,value) in self.enumerated() {
            if value != "0" {
                let offset = i - self.count
                let index = self.index(self.endIndex, offsetBy: offset)
                valueEndNumber = String(self.suffix(from: index))
                return valueEndNumber
            }
        }
        return valueEndNumber
    }
    
    func conversionParam() -> String {
        return self.replacingOccurrences(of: "=", with: "")
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
    }
    
    func replaceBreak() -> String {
        return self.replacingOccurrences(of: "<br>", with: "\n")
    }

    // MARK: - REALM

    func dictionaryValue() -> [String: Any] {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                    return json
                }
            } catch {
                print("Error converting to JSON")
            }
        }

        return NSDictionary() as! [String : Any]
    }

	// MARK: - URL

	public var url: URL? {
		return URL(string: self)
	}

	// MARK: - Remove char from end

	func removeCharsFromEnd(count: Int) -> String {
		let stringLength = self.count

		let substringIndex = (stringLength < count) ? 0 : stringLength - count

		return self.subString(fromIndex: 0, toIndex: substringIndex)
	}

	// MARK: - Uppercase String

	func capitalizingFirstLetter() -> String {
		return prefix(1).uppercased() + self.lowercased().dropFirst()
	}
    
    // MARK: - NSRange
    
    func getNSRangeOf(_ str: String) -> NSRange? {
        if let range = self.range(of: str) {
            return NSRange(range, in: str)
        }
        
        return nil
    }

	// MARK: - Hashtag

	func hashtags() -> [String]?
	{
		if let regex = try? NSRegularExpression(pattern: "#[a-z0-9]+", options: .caseInsensitive)
		{
			let string = self as NSString

			return regex.matches(in: self, options: [], range: NSRange(location: 0, length: string.length)).map {
				string.substring(with: $0.range).replacingOccurrences(of: "#", with: "").lowercased()
			}
		}

		return nil
	}

	// MARK: - Prefix Suffix

	// Prefix

	func caseInsensitiveHasPrefix(_ prefix: String) -> Bool {
		return lowercased().hasPrefix(prefix.lowercased())
	}

	// Suffix

	func caseInsensitiveHasSuffix(_ suffix: String) -> Bool {
		return lowercased().hasSuffix(suffix.lowercased())
	}

	// NSLocalizedString

	var localized: String {
		return NSLocalizedString(self, comment: "")
	}
}
