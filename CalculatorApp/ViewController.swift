//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Loïc Leprieur on 05/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var b0 : UIButton!
    @IBOutlet var b1 : UIButton!
    @IBOutlet var b2 : UIButton!
    @IBOutlet var b3 : UIButton!
    @IBOutlet var b4 : UIButton!
    @IBOutlet var b5 : UIButton!
    @IBOutlet var b6 : UIButton!
    @IBOutlet var b7 : UIButton!
    @IBOutlet var b8 : UIButton!
    @IBOutlet var b9 : UIButton!
    
    @IBOutlet var bAdd : UIButton!
    @IBOutlet var bSub : UIButton!
    @IBOutlet var bDiv : UIButton!
    @IBOutlet var bMod : UIButton!
    
    @IBOutlet var bEqual : UIButton!
    @IBOutlet var bReset : UIButton!
    
    @IBOutlet var txtFRes : UITextField!
    
    var firstNum = ""
    var secondNum = ""
    var operatorOfCal : String!
    
    var isFirstNumber = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reset(sender : UIButton){
        firstNum = ""
        secondNum = ""
        txtFRes.text = ""
        operatorOfCal = ""
    }
    
    @IBAction func addOperator(sender: UIButton){
        operatorOfCal = sender.currentTitle ?? "Nil"
        isFirstNumber = false
        txtFRes.text = operatorOfCal
    }
    
    @IBAction func addANumber(sender: UIButton){
        if firstNum == "" {
            txtFRes.text = ""
        }
        
        let val = sender.currentTitle
        if !isFirstNumber {
            secondNum += val!
            txtFRes.text = secondNum
        } else {
            firstNum += val!
            txtFRes.text = firstNum
        }
        
    }
    
    
    @IBAction func calculate(sender: UIButton){
        var res = 0
        var hasErrors = false
        
        if operatorOfCal == "+" {
            res = Int(firstNum)! + Int(secondNum)!
        } else if operatorOfCal == "-" {
            res = Int(firstNum)! - Int(secondNum)!
        } else if operatorOfCal == "/" {
            res = Int(firstNum)! / Int(secondNum)!
        } else if operatorOfCal == "*" {
            res = Int(firstNum)! * Int(secondNum)!
        } else if operatorOfCal == "Mod" {
            res = Int(firstNum)! % Int(secondNum)!
        } else {
            hasErrors = true
        }
        
        if hasErrors == false {
            txtFRes.text = String(res)
        } else {
            txtFRes.text = "ERROR"
        }
        
        isFirstNumber = true
    }


}

