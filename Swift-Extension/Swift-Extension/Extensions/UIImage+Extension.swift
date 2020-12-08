//
//  UIImage+Extension.swift
//  Swift-Extension
//
//  Created by mybkhn on 2020/12/08.
//  Copyright © 2020 Huy Pham Quang. All rights reserved.
//

import UIKit

extension UIImage {
	func scaledDown(into size:CGSize) -> UIImage {
		var (targetWidth, targetHeight) = (self.size.width, self.size.height)
		var (scaleW, scaleH) = (1 as CGFloat, 1 as CGFloat)

		if targetWidth > size.width {
			scaleW = size.width/targetWidth
		}

		if targetHeight > size.height {
			scaleH = size.height/targetHeight
		}
		
		let scale = min(scaleW,scaleH)
		targetWidth *= scale; targetHeight *= scale
		let sz = CGSize(width: targetWidth, height: targetHeight)

		return UIGraphicsImageRenderer(size:sz).image { _ in
			self.draw(in:CGRect(origin:.zero, size:sz))
		}
	}
}
