//
//  Queue.swift
//  Calculation
//
//  Created by Admin on 2021/6/17.
//  Copyright © 2021 Ma. All rights reserved.
//  数组实现队列

import UIKit

class Queue<T> {
    var list = Array<T>()
    
    var isEmpty:Bool{
        return list.count == 0
    }
    
    ///入列
    func push(_ element:T) {
       list.append(element)
    }
    
    ///出列
    func pop() -> T? {
        if isEmpty {
            return nil
        }else{
            let first = list.first
            list.remove(at: 0)
            return first
        }
    }
    
    ///查看队列第一个元素
    func peek() -> T? {
        return list.first
    }
    
    ///队列入口元素
    func back() -> T? {
        return list.last
    }
    
    ///弹出队列入口数值
    func pop_back() -> T? {
        if isEmpty {
            return  nil
        }else{
            let last = list.last
            list.removeLast()
            return last
        }
    }
    
    ///添加数据到队列出口处
    func push_back(_ value:T)  {
        list.insert(value, at: 0)
    }
    
    
    //打印当前队列元素
    func Print() {
        print("<-出口<-")
        print(self.list)
        print("<-入口")
    }
}
