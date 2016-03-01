//
//  RoundButton.swift
//  devsign-CustomFocusEffect
//
//  Created by Bryan Clark on 3/1/16.
//  Copyright © 2016 Devsign. All rights reserved.
//

import UIKit

extension CustomFocusableButton {
	public static func roundButtonWithColor(backgroundColor: UIColor, diameter: CGFloat) -> CustomFocusableButton {
		let button = CustomFocusableButton(focusedStyle: AppTheme.CustomFocus.defaultFocusedStyle)
		button.setBackgroundImage(CustomFocusableButton.roundBackgroundImageWithFillColor(backgroundColor, diameter: diameter), forState: .Normal)

		return button
	}

	private static func roundBackgroundImageWithFillColor(fillColor: UIColor, diameter: CGFloat) -> UIImage {
		let size = CGSize(width: diameter, height: diameter)
		let rect = CGRect(origin: CGPoint.zero, size: size)

		UIGraphicsBeginImageContext(size)
		let context = UIGraphicsGetCurrentContext()

		// Create a circular image of the right size
		CGContextSetFillColorWithColor(context, fillColor.CGColor)
		CGContextFillEllipseInRect(context, rect)

		// Get the results!
		let outputImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()

		return outputImage
	}
}