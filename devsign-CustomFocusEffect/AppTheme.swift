//
//  AppTheme.swift
//  devsign-CustomFocusEffect
//
//  Created by Bryan Clark on 3/1/16.
//  Copyright © 2016 Devsign. All rights reserved.
//

import UIKit

// Color With Hex stuff
// via http://stackoverflow.com/questions/1560081/how-can-i-create-a-uicolor-from-a-hex-string
extension UIColor{
	private convenience init(hex: UInt, alpha: CGFloat) {
		self.init(
			red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
			green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
			blue: CGFloat(hex & 0x0000FF) / 255.0,
			alpha: CGFloat(alpha)
		)
	}

	private convenience init(hex: UInt) {
		self.init(hex: hex, alpha: 1.0)
	}
}

struct AppTheme {
	struct Colors {
		static let whiteColor = UIColor(hex: 0xFFFFFF)
		static let blueColor = UIColor(hex: 0x0480EE)
		static let greenColor = UIColor(hex: 0x54BF98)

		static let backgroundColor = UIColor(hex: 0x333333)
	}

	struct Shadows {
		static let shadowColor = AppTheme.Colors.backgroundColor.CGColor
		static let shadowOpacity: Float = 0.4
		static let shadowRadius: CGFloat = 5
		static let shadowOffset = CGSizeZero

		static func applyShadowToLayer(layer: CALayer) {
			layer.shadowColor = Shadows.shadowColor
			layer.shadowOpacity = Shadows.shadowOpacity
			layer.shadowRadius = Shadows.shadowRadius
			layer.shadowOffset = Shadows.shadowOffset
		}
	}

	struct CustomFocus {
		static let defaultFocusedStyle = FocusedStyle(
			transform: CGAffineTransformMakeScale(1.1, 1.1),
			shadowColor: UIColor.blackColor().colorWithAlphaComponent(0.3).CGColor,
			shadowOffset: CGSize(width: 0, height: 16),
			shadowRadius: 25)

		static let defaultParallaxStyle = ParallaxStyle(
			shiftHorizontal: 4,
			shiftVertical: 4,
			tiltHorizontal: 10,
			tiltVertical: 10,
			focusStyle: CustomFocus.defaultFocusedStyle)
	}
}