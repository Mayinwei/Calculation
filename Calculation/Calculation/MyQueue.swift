//
//  MyQueue.swift
//  Calculation
//
//  Created by 马银伟 on 2021/6/16.
//  Copyright © 2021 Ma. All rights reserved.
//  用栈实现队列

import UIKit

class MyQueue {
    //输入栈
    var stIn:Stack<Int>
    //输出栈
    var stOut:Stack<Int>
    init() {
        self.stIn = Stack<Int>()
        self.stOut = Stack<Int>()
    }
    
    /** 添加元素到队列的末尾 */
    func push(_ x: Int) {
        stIn.push(x)
    }
    
    /** 从队列前面移除元素并返回该元素. */
    func pop() -> Int {
        //如果输出栈为空就把输入栈中全部移动到out中
        if stOut.isEmpty {
            while !stIn.isEmpty {
                stOut.push(stIn.pop()!)
            }
        }
        
        return stOut.pop()!
    }
    
    /** 获取前端元素. */
    func peek() -> Int {
        //直接使用已有的pop函数
        let res = pop()
        //在重新压回去
        stOut.push(res)
        
        return res
    }
    
    /** 返回队列是否为空 */
    func empty() -> Bool {
        // 当 stIn 栈为空时，说明没有元素可以倒腾到 stOut 栈了
        // 并且 stOut 栈也为空时，说明没有以前从 stIn 中倒腾到的元素了
        return stIn.isEmpty && stOut.isEmpty;
    }
    
}
