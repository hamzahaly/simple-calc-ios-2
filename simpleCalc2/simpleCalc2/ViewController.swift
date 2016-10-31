//
//  ViewController.swift
//  simpleCalc2
//
//  Created by iGuest on 10/26/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number = Double()
    var num1 = Double()
    var num2 = Double()
    var operation = String()
    var didPress = true
    var results = Double()
    var numArray = [Double]()
    var equals = String()
    var history = [String]()
    var expression: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        operation = "="
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var numDisplay: UITextField!
    
    @IBAction func historyBtn(_ sender: UIButton) {
            performSegue(withIdentifier: "HistorySegue", sender: nil)
        
    }
    
    @IBAction func numInput(_ sender: UIButton) {
        number = number * 10 + Double(sender.titleLabel!.text!)!
        numDisplay.text = ("\(Int(number))")
        didPress = true
    }

    @IBAction func operationInput(_ sender: UIButton) {
        switch operation {
        case "=":
            print("equals")
            if (didPress == true) {
                print("appending")
                numArray.append(number)
            }
            num1 = number
            results = number
            didPress = false
        case "+":
            print("adding")
            results = results + number
            didPress = false
            expression = "\(num1) \(operation) \(num2) = \(results)"
            history.append(expression)
        case "-":
            print("subtracting")
            results = results - number
            didPress = false
            expression = "\(num1) \(operation) \(num2) = \(results)"
            history.append(expression)
        case "*":
            print("multiplying")
            results = results * number
            didPress = false
            expression = "\(num1) \(operation) \(num2) = \(results)"
            history.append(expression)
        case "/":
            print("dividing")
            results = results / number
            didPress = false
            expression = "\(num1) \(operation) \(num2) = \(results)"
            history.append(expression)
        case "%":
            print("modding")
            var final: Int
            final = Int(results) % Int(number)
            results = Double(final)
            didPress = false
            expression = "\(num1) \(operation) \(num2) = \(results)"
            history.append(expression)
        case "Fact":
            print("factorial")
            var fact = results
            var operand = results - 1
            if results == 0 {
                results = 1
            } else {
                for _ in 1...Int(results) - 1 {
                    fact = fact * operand
                    print(fact)
                    operand -= 1
                    results = fact
                }
            }
            numDisplay.text = ("\(results)")
            expression = "\(num1) \(operation) = \(results)"
            history.append(expression)
        case "Count":
            print("count")
            if (didPress == true) {
                print("appending")
                numArray.append(number)
            }
            didPress = false
            print(numArray)
            results = Double(numArray.count)
        case "Avg":
            print("avg")
            if (didPress == true) {
                numArray.append(number)
            }
            didPress = false
            results = 0.0
            for num in numArray {
                results += num
                print(num)
                print(results)
            }
            print(numArray)
            results = results / Double(numArray.count)
        case "Clear":
            results = number
            operation = "="
            numArray.removeAll()
            numDisplay.text = ("\(results)")
            didPress = false
        default:
            print("error")
        }
        num2 = number
        operation = sender.titleLabel!.text!
        number = 0
        numDisplay.text = ("\(results)")
        print(history)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let guest = segue.destination as! HistoryViewController
        guest.historyLabel = sender as! UILabel
    }
    
}

