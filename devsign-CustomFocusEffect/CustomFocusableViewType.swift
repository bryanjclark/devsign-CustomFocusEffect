//
//  CustomFocusableViewType.swift
//  Blackjack
//
//  Created by Bryan Clark on 1/21/16.
//  Copyright © 2016 Blixt. All rights reserved.
//

import UIKit


public protocol CustomFocusableViewType {
	var view: UIView { get }
	var focusedStyle: FocusedStyle { get }
}

public extension CustomFocusableViewType {
	func displayAsFocused(focused: Bool) {
		view.layer.shadowOpacity = focused ? 1 : 0
		view.transform = focused ? focusedStyle.transform : CGAffineTransformIdentity
	}
}

/// Represents the focused style for a custom focus effect.
/// (Be sure to include the alpha in the `shadowColor` property - we use layer.shadowOpacity to toggle the appearance of the shadow!)
public struct FocusedStyle {
	let transform: CGAffineTransform
	let shadowColor: CGColor
	let shadowOffset: CGSize
	let shadowRadius: CGFloat
}