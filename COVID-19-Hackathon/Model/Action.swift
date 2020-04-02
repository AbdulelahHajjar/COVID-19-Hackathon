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
		var cString:String = withHex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
		
		if (cString.hasPrefix("#")) {
			cString.remove(at: cString.startIndex)
		}
		
		if ((cString.count) != 6) {
			return UIColor.gray.cgColor
		}
		
		var rgbValue:UInt64 = 0
		Scanner(string: cString).scanHexInt64(&rgbValue)
		
		return UIColor(
			red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
			green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
			blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
			alpha: CGFloat(1.0)
		).cgColor
	}
}
