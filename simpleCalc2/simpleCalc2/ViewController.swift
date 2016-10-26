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
    var operation = String()
    var didPress = true
    var results = Double()
    var numArray = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var numDisplay: UITextField!
    
    @IBAction func numInput(_ sender: UIButton) {
        number = number * 10 + Double(sender.titleLabel!.text!)!
        numDisplay.text = ("\(Int(number))")
    }

    @IBAction func operationInput(_ sender: UIButton) {
        switch operation {
        case "=":
            print("equals")
            print(number)
            print(results)
            if (didPress == true) {
                print("appending")
                numArray.append(number)
            }
            results = number
            didPress = false
        case "+":
            print("adding")
            results = results + number
            didPress = false
        case "-":
            print("subtracting")
            results = results - number
            didPress = false
        case "*":
            print("multiplying")
            results = results * number
            didPress = false
        case "/":
            print("dividing")
            results = results / number
            didPress = false
        case "%":
            print("modding")
            var final: Int
            final = Int(results) % Int(number)
            results = Double(final)
            didPress = false
        case "Fact":
            print("factorial")
            var fact = number
            var operand = number - 1
            if number == 0 {
                results = 1
            } else {
                for _ in 1...Int(number) - 1 {
                    fact = fact * operand
                    print(fact)
                    operand -= 1
                    results = fact
                }
            }
            numDisplay.text = ("\(results)")
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
        number = 0
        numDisplay.text = ("\(results)")
        
        operation = sender.titleLabel!.text!
    }
}

