//
//  CGSize+Extension.swift
//  Swift-Extension
//
//  Created by mybkhn on 2020/12/08.
//  Copyright © 2020 Huy Pham Quang. All rights reserved.
//

import Foundation
import UIKit

extension CGSize {
	init(_ width:CGFloat, _ height:CGFloat) {
		self.init(width:width, height:height)
	}
	
	func withDelta(dw:CGFloat, dh:CGFloat) -> CGSize {
		return CGSize(self.width + dw, self.height + dh)
	}
}
