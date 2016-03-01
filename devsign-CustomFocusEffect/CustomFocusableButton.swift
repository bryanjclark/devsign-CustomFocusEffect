//
//  CustomFocusableButton.swift
//  Blackjack
//
//  Created by Bryan Clark on 1/21/16.
//  Copyright © 2016 Blixt. All rights reserved.
//

import UIKit

/// An implementation of CustomParallaxView that implements a pressDown state when Select is clicked.
/// Particularly useful for non-roundrect button shapes.
public class CustomFocusableButton: UIButton {
	public let focusedStyle: FocusedStyle

	public init(focusedStyle: FocusedStyle) {
		self.focusedStyle = focusedStyle

		super.init(frame: CGRectZero)

		view.layer.shadowColor = focusedStyle.shadowColor
		view.layer.shadowOffset = focusedStyle.shadowOffset
		view.layer.shadowRadius = focusedStyle.shadowRadius
	}

	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: Focus Engine Stuff

	// MARK: Animating selection - buttons should shrink & all that when they're clicked!
	public override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
		super.pressesBegan(presses, withEvent: event)
		guard presses.count == 1 else { return } // If you press multiple buttons at the same time, that shouldn't trigger a pressDown() animation.

		for press in presses where press.type == .Select {
			pressDown()
		}
	}

	public override func pressesEnded(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
		super.pressesEnded(presses, withEvent: event)

		for press in presses where press.type == .Select {
			pressUp()
		}
	}

	public override func pressesCancelled(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
		super.pressesCancelled(presses, withEvent: event)

		for press in presses where press.type == .Select {
			pressUp()
		}
	}

	private func pressDown() {
		UIView.animateWithDuration(0.1,
			delay: 0.0, usingSpringWithDamping: 0.9,
			initialSpringVelocity: 0.0,
			options: .BeginFromCurrentState,
			animations: { () -> Void in
				self.displayAsFocused(false)
			}, completion: nil)
	}

	private func pressUp() {
		UIView.animateWithDuration(0.2,
			delay: 0,
			usingSpringWithDamping: 0.9,
			initialSpringVelocity: 0,
			options: .BeginFromCurrentState,
			animations: { () -> Void in
				self.displayAsFocused(true)
			}, completion: nil)
	}
}

extension CustomFocusableButton: CustomFocusableViewType {
	public var view: UIView { return self }
}