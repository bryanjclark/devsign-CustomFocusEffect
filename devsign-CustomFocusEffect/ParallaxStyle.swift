//
//  ParallaxStyle.swift
//  Blackjack
//
//  Created by Bryan Clark on 1/21/16.
//  Copyright © 2016 Blixt. All rights reserved.
//

import UIKit

/// Represents the tilting & shifting parallax effect when you nudge your thumb slightly on a focused UIView
public struct ParallaxStyle {
	/// The max amount by which center.x will shift.
	/// Use a negative number for a reverse effect.
	let shiftHorizontal: Double

	/// The max amount by which center.y will shift.
	/// Use a negative number for a reverse effect.
	let shiftVertical: Double

	/// The max amount by which the view will rotate side-to-side, in radians.
	/// Use a negative number for a reverse effect.
	let tiltHorizontal: Double

	/// The max amount by which the view will rotate up-and-down, in radians.
	/// Use a negative number for a reverse effect.
	let tiltVertical: Double

	/// The focused appearance for a view
	let focusStyle: FocusedStyle

	var motionEffectGroup: UIMotionEffectGroup {

		func toRadians(degrees: Double) -> Double {
			return degrees * M_PI_2 / 180;
		}

		let shiftX = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
		shiftX.minimumRelativeValue = -shiftHorizontal
		shiftX.maximumRelativeValue = shiftHorizontal

		let shiftY = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
		shiftY.minimumRelativeValue = -shiftVertical
		shiftY.maximumRelativeValue = shiftVertical

		let rotateX = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.y", type: .TiltAlongHorizontalAxis)
		rotateX.minimumRelativeValue = toRadians(-tiltHorizontal)
		rotateX.maximumRelativeValue = toRadians(tiltHorizontal)

		let rotateY = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.x", type: .TiltAlongVerticalAxis)
		rotateY.minimumRelativeValue = toRadians(-tiltVertical)
		rotateY.maximumRelativeValue = toRadians(tiltVertical)

		let motionGroup = UIMotionEffectGroup()
		motionGroup.motionEffects = [shiftX, shiftY, rotateX, rotateY]

		return motionGroup
	}
}
