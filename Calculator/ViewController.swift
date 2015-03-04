//
//  ViewController.swift
//  Calculator
//
//  Created by Ioannis Mastigopoulos on 04/02/2015.
//  Copyright (c) 2015 ioannis.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var display: UILabel!
	
	var userIsInTheMiddleOfTypingANumber:Bool = false
	
	@IBAction func appendDigit(sender: UIButton) {
		let digit = sender.currentTitle!
		if userIsInTheMiddleOfTypingANumber{
			display.text = display.text! + digit
		}
		else{
			display.text = digit
			userIsInTheMiddleOfTypingANumber = true
		}
	}
	//Blah Blah some comments
}
