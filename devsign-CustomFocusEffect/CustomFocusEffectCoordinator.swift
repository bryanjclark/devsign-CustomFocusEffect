//
//  CustomFocusEffectCoordinator.swift
//  Blackjack
//
//  Created by Bryan Clark on 1/20/16.
//  Copyright © 2016 Blixt. All rights reserved.
//

import UIKit

/// Manages the intersection of UIMotionEffects and the tvOS Focus Engine, to provide a nice parallax/focus effect on custom controls.
public class CustomFocusEffectCoordinator {
	private let views: Set<UIView>
	private let motionEffectGroup: UIMotionEffectGroup

	/// Coordinates the given motion effect for the given views.
	public init(views: [UIView], parallaxStyle: ParallaxStyle) {
		self.views = Set(views)

		self.motionEffectGroup = parallaxStyle.motionEffectGroup
	}

	/// Call this function within your `didUpdateFocusInContext` method to create a parallax effect!
	public func updateFromContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
		coordinator.addCoordinatedAnimations({

			if let previousView = context.previouslyFocusedView as? CustomFocusableViewType {
				if self.views.contains(previousView.view) {
					previousView.displayAsFocused(false)
					previousView.view.removeMotionEffect(self.motionEffectGroup)
				}
			}

			if let nextView = context.nextFocusedView as? CustomFocusableViewType {
				if self.views.contains(nextView.view) {
					nextView.displayAsFocused(true)
					nextView.view.addMotionEffect(self.motionEffectGroup)
				}
			}

			}, completion: nil)
	}

	/// When you're ready to destroy the effect, call this function.
	public func removeMotionEffectsFromAllViews() {
		views.forEach { $0.removeMotionEffect(motionEffectGroup) }
	}
}