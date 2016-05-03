//
//  Swift 初见
//  http://wiki.jikexueyuan.com/project/swift/chapter1/02_a_swift_tour.html
//  ViewController.swift
//  SwiftProgramming
//
//  Created by even.wu on 28/4/16.
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
        conditionForIn()
        
        printSomeThing(greet("Tom", day: "Tuesday"))
        
        let statistics = calculateStatistics([5, 3, 100, 3, 9])
        printSomeThing("statistics.min = \(statistics.min)")
        printSomeThing("statistics.max = \(statistics.max)")
        printSomeThing("statistics.sum = \(statistics.sum)")
        
        printSomeThing("sum of 75, 35, 12: \(sumOf(75, 35, 12))")
        printSomeThing("sum of : \(sumOf())")
        
        let increment = makeIncrementer()
        increment(7)
        
        let triangle = Square(sideLength: 5.2, name: "My Test Square")
        printSomeThing(triangle.simpleDescription())
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
        
        let nickName: String? = nil
        let fullName: String = "John Appleseed"
        let informalGreeting = "Hi \(nickName ?? fullName)"
        printSomeThing(informalGreeting)
        
        let vegetable = "red pepper"
        switch vegetable {
        case "celery":
            printSomeThing("Add some raisins and make ants on a log")
        case "cucumber", "watercress":
            printSomeThing("That would make a good tea sandwich")
        case let x where x.hasSuffix("pepper"):
            printSomeThing("Is it a spicy \(x)")
        default:
            printSomeThing("Everything tastes good in soup.")
        }
        
        condition2()
    }
    
    func conditionForIn(){
        let interestingNumbers = ["Prime":[2, 3, 5, 7, 11, 13], "Fibonacci": [1, 1, 2, 3, 5, 8], "Squate": [1, 4, 9, 16, 25]]
        var largest = 0
        for(_, numbers) in interestingNumbers{
            for number in numbers{
                if number > largest{
                    largest = number
                }
            }
        }
        printSomeThing("largest:" + String(largest))
    }
    
    func condition2(){
        var n = 2
        while n < 100 {
            n = n * 2
        }
        print(n)
        
        var m = 2
        repeat{
            m = m * 2
        }while  m < 100
        print (m)
        
        var total = 0
        for i in 0..<4{
            total += i
        }
        print(total)
        
        total = 0
        for i in 0...4 {
            total += i
        }
        print(total)
    }
    
    func greet(name: String, day: String) -> String{
        return "Hello,\(name),today is \(day)"
    }
    
    func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int){
        var min = scores[0]
        var max = scores[0]
        var sum = scores[0]
        
        for score in scores{
            if min > score{
                min = score
            }
            if max < score{
                max = score
            }
            sum += score
        }
        
        return (min, max, sum)
    }
    
    func sumOf(numbers: Int...) -> Int{
        var sum = 0
        for number in numbers{
            sum += number
        }
        return sum
    }
    
    func makeIncrementer() -> (Int -> Int){
        func addOne(number: Int) -> Int{
            return number + 1
        }
        return addOne
    }
    
    class NameShape {
        var numberOfSides: Int = 0
        var name: String
        
        init(name: String){
            self.name = name
        }
        
        func simpleDescription() -> String{
            return "A shape with \(numberOfSides) sides."
        }
    }
    
    class Square: NameShape {
        var sideLength: Double
        
        init(sideLength: Double, name: String){
            self.sideLength = sideLength
            super.init(name: name)
            numberOfSides = 3
        }
        
        var perimeter: Double{
            get{
                return 3.0 * sideLength
            }
            
            set{
                sideLength = newValue / 3.0
            }
        }
        
        override func simpleDescription() -> String {
            return "An equilateral triggle with sides of length \(sideLength)."
        }
    }
}

