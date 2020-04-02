//
//  Action.swift
//  COVID-19-Hackathon
//
//  Created by Abdulelah Hajjar on 02/04/2020.
//  Copyright © 2020 Squadra. All rights reserved.
//

import Foundation
import UIKit

struct Action {
	let title:		String
	let subtitle:	String
	var colorHEXs =	[CGColor]()
	let image:		UIImage
	
	init(title: String, subtitle: String, color1: String, color2: String, systemImageStr: String) {
		self.title		= title
		self.subtitle	= subtitle
		image			= UIImage(systemName: systemImageStr) ?? UIImage.checkmark
		colorHEXs.append(cgColor(withHex: color1))
		colorHEXs.append(cgColor(withHex: color2))
	}
	
	func cgColor (withHex:String) -> CGColor {
		let r, g, b, a: CGFloat
		var hexColor = withHex
		
		if withHex.hasPrefix("#") {
			let start = withHex.index(withHex.startIndex, offsetBy: 1)
			hexColor = String(withHex[start...])
		}
		
		if hexColor.count == 6 {
			let scanner = Scanner(string: hexColor)
			var hexNumber: UInt64 = 0
			
			if scanner.scanHexInt64(&hexNumber) {
				r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
				g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
				b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
				a = CGFloat(1.00)
				
				return UIColor(red: r, green: g, blue: b, alpha: a).cgColor
			}
		}
		return UIColor.black.cgColor
	}
}
