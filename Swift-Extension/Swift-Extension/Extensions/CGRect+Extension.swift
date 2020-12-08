//
//  CGRect+Extension.swift
//  Swift-Extension
//
//  Created by mybkhn on 2020/12/08.
//  Copyright © 2020 Huy Pham Quang. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
	init(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat) {
		self.init(x:x, y:y, width:w, height:h)
	}

	var center : CGPoint {
		return CGPoint(self.midX, self.midY)
	}

	func centeredRectOfSize(_ sz:CGSize) -> CGRect {
		let c = self.center
		let x = c.x - sz.width/2.0
		let y = c.y - sz.height/2.0
		return CGRect(x, y, sz.width, sz.height)
	}
}
