//
//  ViewController.swift
//  Swift-Extension
//
//  Created by Huy Pham Quang on 5/3/20.
//  Copyright © 2020 Huy Pham Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

		createUrlUsage()

		subStringFromEndUsage()

		uppercaseStringUsage()

		arrayUnifyUsage()
        
        statusBarBackgroundColorTest()
    }

	func createUrlUsage() {
		if let url = "https://www.google.com/".url {
			print(url.absoluteString)
		}
	}

	func subStringFromEndUsage() {
		let str = "abcdefghijklmn".removeCharsFromEnd(count: 3)
		print(str)
	}

	func uppercaseStringUsage() {
		let str = "hello world."
		print(str.firstUppercased)
		print(str.capitalizingFirstLetter())
	}

	func arrayUnifyUsage() {
		let array = [1, 2, 3, 3, 2, 1, 4]
		let result = array.unified()
		print(result)
		// [1, 2, 3, 4]
	}
    
    func statusBarBackgroundColorTest() {
//        UIApplication.shared.statusBarView?.backgroundColor = .red
        self.navigationController?.setStatusBar(backgroundColor: .red)
    }
}

