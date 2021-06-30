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

	enum JPEGQuality: CGFloat {
		case lowest  = 0
		case low     = 0.25
		case medium  = 0.5
		case high    = 0.75
		case highest = 1
	}

	/// Returns the data for the specified image in JPEG format.
	/// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
	/// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
	func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
		return jpegData(compressionQuality: jpegQuality.rawValue)
	}
}
