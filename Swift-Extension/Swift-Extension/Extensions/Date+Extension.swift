
import Foundation

// DateFormat
enum DateFormat: String {
    case MMyyyy = "MM/yyyy"
    case ddmmSlash = "dd/MM/yyyy HH:mm"
    case ddMMyyyy = "dd/MM/yyyy"
    case yyyyssDash = "yyyy-MM-dd'T'HH:mm:ss"
    case yyyyssSSSZZZZZ = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    case yyyyMMdd = "yyyyMMdd"
    case yyyyMMddDot = "yyyy.MM.dd"
    case yyyyMMddDash = "yyyy-MM-dd"
    case yyyyMMddSlash = "yyyy/MM/dd"
    case yyyyMMddDotHHmmss = "yyyy.MM.dd HH:mm:ss"
    case yyyyMMddJp = "yyyy年MM月dd日"
    case HHmm = "HHmm"
}

enum LocaleIdentifier: String {
    case enUSPOSIX = "en_US_POSIX"
}

extension Date {
    
    func convertToString(with dateFormat: DateFormat) -> String {
        let dateFormatter = DateFormatter.standard
        dateFormatter.dateFormat = dateFormat.rawValue
        return dateFormatter.string(from: self)
    }
    
    func added(year: Int? = nil, month: Int? = nil, day: Int? = nil) -> Date {
        let calender = Calendar.standard
        var comp = DateComponents()
        comp.year = calender.component(.year, from: self) + (year ?? 0)
        comp.month = calender.component(.month, from: self) + (month ?? 0)
        comp.day = calender.component(.day, from: self) + (day ?? 0)
        
        return calender.date(from: comp)!
    }
}
