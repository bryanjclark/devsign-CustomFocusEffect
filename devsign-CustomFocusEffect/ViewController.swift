//
//  ViewController.swift
//  devsign-CustomFocusEffect
//
//  Created by Bryan Clark on 3/1/16.
//  Copyright © 2016 Devsign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	private static let buttonDiameter: CGFloat = 200

	private let roundButtonOne = CustomFocusableButton.roundButtonWithColor(AppTheme.Colors.whiteColor, diameter: ViewController.buttonDiameter)
	private let roundButtonTwo = CustomFocusableButton.roundButtonWithColor(AppTheme.Colors.greenColor, diameter: ViewController.buttonDiameter)
	private let roundButtonThree = CustomFocusableButton.roundButtonWithColor(AppTheme.Colors.blueColor, diameter: ViewController.buttonDiameter)

	private var focusEffectCoordinator: CustomFocusEffectCoordinator!

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = AppTheme.Colors.backgroundColor

		// Layout the round buttons
		let margin: CGFloat = 60
		let offsetAmount = ViewController.buttonDiameter + margin

		roundButtonOne.frame = CGRect(origin: CGPoint(x: margin, y: margin), size: CGSize(width: ViewController.buttonDiameter, height: ViewController.buttonDiameter))
		roundButtonTwo.frame = CGRectOffset(roundButtonOne.frame, offsetAmount, 0)
		roundButtonThree.frame = CGRectOffset(roundButtonTwo.frame, offsetAmount, 0)

		let roundButtons = [roundButtonOne, roundButtonTwo, roundButtonThree]
		roundButtons.forEach { view.addSubview($0) }

		// Create our focus coordinator
		focusEffectCoordinator = CustomFocusEffectCoordinator(views: roundButtons, parallaxStyle: AppTheme.CustomFocus.defaultParallaxStyle)
	}

	// MARK: Focus Engine

	override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
		focusEffectCoordinator.updateFromContext(context, withAnimationCoordinator: coordinator)
	}


}

