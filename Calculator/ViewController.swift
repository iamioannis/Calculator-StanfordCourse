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
	
	// Additional functionality. Not explained throught the lecture
	// Double check if the way of reseting text is following best practice
	@IBAction func clear() {
		operandStack.removeAll(keepCapacity: false)
		display.text = "0"
	}
	@IBAction func operate(sender: UIButton) {
		let operation = sender.currentTitle!
		if userIsInTheMiddleOfTypingANumber{
			enter()
		}
		switch operation{
		case "×": performOperation{ $0 * $1 }
		case "÷": performOperation{ $1 / $0 }
		case "+": performOperation{ $0 + $1 }
		case "−": performOperation{ $1 - $0 }
		case "√": performOperation{ sqrt($0) }
		default: break
		}
		
	}
	
	//Funcrion that performs AN operation taking TWO doubles as arguments and and returns a Double as the result
	func performOperation(operation: (Double,Double) ->Double) {
		if operandStack.count >= 2{
			displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
			enter()
		}

	}
	
	// This is (if it can be described this way) an overide of the performOperation function for the purpose of handling single arguments during operation eg square root calculation.
	func performOperation(operation: Double -> Double){
		if operandStack.count >= 1{
			displayValue = operation(operandStack.removeLast())
			enter()
		}
		
	}
	
	// Colection that stores values entered by the user. Can be preceaved as the heap for the calculations
	var operandStack = Array<Double>()
	
	@IBAction func enter() {
		userIsInTheMiddleOfTypingANumber = false
		operandStack.append(displayValue)
		println("operandStack = \(operandStack)")
	}
	
	var displayValue: Double{
		get{
			return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
		}
		set{
			display.text = "\(newValue)"
			userIsInTheMiddleOfTypingANumber = false
		}
	}
	
}

