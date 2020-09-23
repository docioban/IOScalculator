//
//  ViewController.swift
//  calculator
//
//  Created by Macbook Pro on 9/23/20.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var resultNumber: Double = 0
    //var isFirst: Bool = true
    var toDelete: Bool = true
    var semn: Character = "."

    @IBOutlet weak var result: UILabel!
    
    @IBAction func PressDigits(_ sender: UIButton) {
        if toDelete {
            result.text = ""
            toDelete = false
        }
        if sender.tag == 11 {
            if result.text != "" {
                firstNumber = Double(result.text!)!
                result.text = String(-1.0*firstNumber)
            }
        } else if sender.tag == 18 {
            result.text! += ".";
        } else {
            result.text! += String(sender.tag)
        }
    }
    
    @IBAction func PressOperation(_ sender: UIButton) {
        firstNumber = Double(result.text!)!
        if sender.tag == 12 { // %
            semn = "%"
        } else if sender.tag == 13 { // /
            semn = "/"
        } else if sender.tag == 14 { // X
            semn = "X"
        } else if sender.tag == 15 { // -
            semn = "-"
        } else if sender.tag == 16 { // +
            semn = "+"
        }
        toDelete = true
        
    }
    
    @IBAction func newCalcul(_ sender: UIButton) {
        result.text = "0"
        toDelete = true
    }
    
    @IBAction func Egal(_ sender: UIButton) {
        secondNumber = Double(result.text!)!
        if semn == "%" {
            
        } else if semn == "/" {
            resultNumber = firstNumber / secondNumber
        } else if semn == "X" {
            resultNumber = firstNumber * secondNumber
        } else if semn == "-" {
            resultNumber = firstNumber - secondNumber
        } else if semn == "+" {
            resultNumber = firstNumber + secondNumber
        }
        result.text = String(resultNumber)
        toDelete = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

