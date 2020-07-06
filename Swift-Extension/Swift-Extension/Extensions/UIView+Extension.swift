
import UIKit

extension UIView {
    class func fromNib() -> UIView? {
        return Bundle(for: self).loadNibNamed(String(describing: self), owner: nil, options: nil)?.first as? UIView
    }
}
