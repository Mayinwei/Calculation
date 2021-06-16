//
//  Stack.swift
//  Calculation
//
//  Created by 马银伟 on 2021/6/16.
//  Copyright © 2021 Ma. All rights reserved.
//  自定义栈的实现

import UIKit

class Stack<T> {
    var array = [T]()
    
    //是否为空
    var isEmpty:Bool{
        return array.isEmpty
    }
    
    var count:Int{
        return array.count
    }
    
    //入栈
    func push(_ element:T) {
        array.append(element)
    }
    
    //出栈
    func pop() -> T? {
        return array.popLast()
    }
    
    //获取栈顶
    func top() -> T? {
        return array.last
    }
}
