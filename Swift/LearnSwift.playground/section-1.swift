//
//  main.swift
//  LearnSwift
//
//  Created by bingoogol on 14-6-5.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import Foundation

// 字符串
func demo1() {
    var name = "王浩"
    name = name + "bingo"
    name = name + "\(100)"
    var id = 50
    var address:String = "重庆市"
    println("id=\(id),name=\(name),address=\(address)")
}


// 类型
func demo2() {
    let minIntValue = Int.min
    let maxIntValue = Int.max
    let minInt8Value = Int8.min
    let maxInt8Value = Int8.max
    let minUInt8Value = UInt8.min
    let maxUInt8Value = UInt8.max
    println("minIntValue=\(minIntValue),maxIntValue=\(maxIntValue)")
    println("minInt8Value=\(minInt8Value),maxInt8Value=\(maxInt8Value)")
    println("minUInt8Value=\(minUInt8Value),maxUInt8Value=\(maxUInt8Value)")
    
    let value1 = 12_000_000  // 只是为了可读性
    let value2 = 1_000_000.000_000_1
    println("value1=\(value1),value2=\(value2)")
    
    
    let value3:Float = 1.3
    let value4:Double = 1.3
    let value5 = 1.3
    println("value3=\(value3),value4=\(value4),value5=\(value5)")
}

func add(num1:Int,num2:Int)->(Int,Int,Int) {
    var result = num1 + num2
    return (num1,num2,result)
}

// 多返回值
func demo3() {
    let (num1,num2,result) = add(2, 3)
    println("\(num1) + \(num2) = \(result)")
}

func sayHello(name:String) {
    println("Hello \(name)")
}

// 函数也是一个对象，意味着可以直接当做一个变量来使用
func demo4() {
    var fun = sayHello
    fun("王浩")
}

// 数组
func demo5() {
    var arr1 = ["Hello","World",5]
    println(arr1)
    println(arr1[2])
    
    var arr2 = [] // 存放任意数据类型
    var arr3 = String[]() // 只能存放特定类型
    arr3.append("Hello")
    arr3.append("Swift")
    println(arr3)
}

// 字典
func demo6() {
    var dict = ["name":"王浩","address":"重庆市"]
    dict["sex"] = "男"
    
    println(dict)
    println(dict["name"])
    
    var dict2:Dictionary<String,Int> = ["name":1,"address":2,"hehe":3,"sdfsdf":4]
    if dict2.removeValueForKey("name") {
        println("删除了")
    } else {
        println("没删除")
    }
    println(dict2.count)
    
    for key in dict2.keys {
        println(key)
    }
    
    for value in dict2.values {
        println(value)
    }
    
    let keys = Array(dict2.keys)
    println(keys)
    let values = Array(dict2.values)
    println(values)
}

// 循环
func demo7() {
    var arr1 = String[]()
    // 包含0，不包含5
    for index in 0..5 {
        arr1.append("Item \(index)")
    }
    println(arr1)
    
    var arr2 = String[]()
    // 包含0，且包含5
    for index in 0...5 {
        arr2.append("Item \(index)")
    }
    println(arr2)
    
    
    for value in arr2 {
        println(value)
    }
    
    
    for (index, value) in enumerate(arr2) {
        println("enumerate index\(index),\(value)")
    }
    
    var i = 0
    while i<arr2.count {
        println(arr2[i])
        i++
    }
    
    var dict = ["name":"王浩","address":"重庆市"]
    
    for (key,value) in dict {
        println("key=\(key),value=\(value)")
    }
}

// 流程控制，可选变量
func demo8() {
    for index in 0..5 {
        if index%2 == 0 {
            println(index)
        }
    }
    
    var name:String? = "bingoogol"
    //name = nil
    if var name2 = name {
        println(name2)
    }
    
    if name {
        println(name)
    }
}

class Animal {
    func sayHi() {
        println("Hi bingoogol")
    }
    
    func sayClassName() {
        println("Animal")
    }
}

class Cat : Animal {
    
    var _name:String
    
    init(name:String) {
        self._name = name
    }
    
    override func sayClassName() {
        println("Cat")
    }
    
    func sayName() {
        println(self._name)
    }
}


func demo9() {
    var animal = Animal()
    animal.sayHi()
    animal.sayClassName()
    
    var cat = Cat(name: "加菲猫")
    cat.sayHi()
    cat.sayClassName()
    cat.sayName()
}

//(num:Int) -> Bool 闭包Closure参数类型
func hasClosureMath(arr:Int[],value:Int,cb:(num:Int,value:Int) -> Bool) ->Bool{
    for item in arr {
        if cb(num:item,value:value) {
            return true
        }
    }
    return false
}



//闭包
func demo10() {
    var arr = [20,9,100,34,89,39]
    // 找是否arr中有比110大的数字
    var v1 = hasClosureMath(arr,110,{
            (num:Int,value:Int) -> Bool in
                return num >= value
            //这里$0表示num   $1表示value
            //return $0 >= $1
        })
    println("v1 is \(v1)")
}

struct QFTest {
    var x = 0;
    var y = 0;
    
    // 真正的构造函数
    // 定义一个空的够着函数，构造函数是以init开头的，自动调用
    init() {
        println("init invoked")
    }
    
    //定义带有两个参数的构造函数
    init(x:Int,y:Int) {
        self.x = x
        self.y = y
        println("init(x:Int,y:Int) invoked")
    }
    
    // _ 这个可以让调用哪个的时候不用谢 x:  y:
    init(_ x:Int,_ y:Int) {
        self.x = x
        self.y = y
        println("init(x:Int,y:Int) invoked")
    }
    
    func getCenter() -> Int {
        return (x + y)/2
    }
    
    // 载调用的时候 xxx.addOffset(100,deltaY:100)，不需要写deltaX
    mutating func addOffset(deltaX:Int,deltaY:Int) {
        // 结构体是一个拷贝的对象，默认是不能修改结构体内部的变量，加上mutating可以让函数修改结构体里面变量的值
        self.x += deltaX
        self.y += deltaY
    }
}

func demo11() {
    var s1 = QFTest(x:100,y:200)
    println("x:\(s1.x)  y:\(s1.y)")
    var s2 = QFTest()
    s2.x = 400
    s2.y = 300
    s2.addOffset(100,deltaY:100)
    println("x:\(s1.x)  y:\(s1.y)  center:\(s2.getCenter())")
}

demo11()










