//
//  Swift 初见
//  http://wiki.jikexueyuan.com/project/swift/chapter1/02_a_swift_tour.html
//  ViewController.swift
//  SwiftProgramming
//
//  Created by vince.yu on 28/4/16.
//  Copyright © 2016年 Even. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        printSomeThing("Hello World!")
        
        learnValue()
        simpleWayConvertString()
        
        learnCollection()
        
        learnConditionControl()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printSomeThing(content:String){
        print(content)
    }
    
    func learnValue(){
        var myVariable = 42
        myVariable = 50
        let myConstant: Int
        myConstant = 42
        printSomeThing("myVariable:" + String(myVariable) + ", myConstant:" + String(myConstant))
        
        let implicitInteger = 70
        let implicitDouble = 70.0
        let explicitDouble: Double = 70
        let explicitFloat: Float = 4
        printSomeThing("implcitInteger:" + String(implicitInteger))
        printSomeThing("implicitDouble:" + String(implicitDouble))
        printSomeThing("explicitDouble:" + String(explicitDouble))
        printSomeThing("explicitFloat:" + String(explicitFloat))
        
        let label = "The Width is"
        let width = 94
        let widthlabel = label + String(width)
        printSomeThing(widthlabel)
    }
    
    func simpleWayConvertString(){
        let apples = 3
        let oranges = 5
        let appleSummary = "I have \(apples) apples"
        let fruitSummary = "I have \(apples + oranges) fruits"
        printSomeThing(appleSummary)
        printSomeThing(fruitSummary)
    }
    
    func learnCollection(){
        var shoppingList = ["catFish", "water", "tulips", "blue paint"]
        shoppingList[1] = "bottle of water"
        
        var occupations = ["Malcolm": "Captain", "kaylee": "Mechanic",]
        occupations["Jayne"] = "Public Relations"
        
        printSomeThing("shoppingList[1]: " + shoppingList[1])
        printSomeThing("occupations[\"Jayne\"]: " + occupations["Jayne"]!)
        
        var emptyArray = [String]()
        var emptyDictionary = [String: String]()
        
        emptyArray = []
        emptyDictionary = [:]
        
        shoppingList = emptyArray
        occupations = emptyDictionary
    }
    
    func learnConditionControl(){
        let individualScores = [75, 43, 103, 87, 12]
        var teamScore = 0
        for score in individualScores{
            if score > 50{
                teamScore += 3
            }else{
                teamScore += 1
            }
        }
        printSomeThing("TeamScore: " + String(teamScore))
        
        let optionalString: String? = "Hello"
        print(optionalString == nil)
        
        let optionalName: String? = "John Appleseed"
        var greeting = "Hello!"
        if let name = optionalName{
            greeting = "Hello, \(name)"
        }
        printSomeThing(greeting)
    }
}

