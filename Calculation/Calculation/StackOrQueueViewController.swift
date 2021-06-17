//
//  StackOrQueueViewController.swift
//  Calculation
//
//  Created by 马银伟 on 2021/6/16.
//  Copyright © 2021 Ma. All rights reserved.
//

import UIKit

class StackOrQueueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
//        let st = Stack<Int>()
//        st.push(10)
//        st.push(11)
//        st.push(12)
//        st.push(13)
//        st.push(14)
//        st.push(15)
//
//        print(st.pop())
//        print(st.count)
        
//        let q = MyQueue()
//        q.push(1)
//        q.pop()
        
//        let result = removeDuplicates("abbaca")
//        print(result)
        
//        let result  = evalRPN(["4","13","5","/","+"])
//        print(result)
        
        let result = maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3)
        print(result)
    }
    
    
    //括号匹配
    func isValid(_ s: String) -> Bool {
        let array = s.map{$0}
        let stack = Stack<String>()
        for i in 0..<array.count {
            let str = String(array[i])
            
            if str == "(" {
                stack.push(")")
            }else if str == "{" {
                stack.push("}")
            }else if str == "[" {
                stack.push("]")
            }else if stack.isEmpty || stack.top() != str {
                return false
            }else{
                //说明匹配上了，弹出栈
                stack.pop()
            }
        }
        
        return stack.isEmpty
    }
    
    
    //删除重复字符串
    func removeDuplicates(_ s: String) -> String {
        let array = s.map{$0}
        let stack = Stack<String>()
        for i in 0..<array.count {
            let str = String(array[i])
            if stack.isEmpty || stack.top() != str {
                stack.push(str)
            }else if stack.top() == str {
                stack.pop()
            }
        }
        
        var result = ""
        while !stack.isEmpty {
            result.append(stack.pop()!)
        }
        //此时字符串是反的
        fanStr(s: &result, start: 0, end: result.count-1)
        return result ;
    }
    
    //翻转字符串
    func fanStr(s:inout String,start:Int,end:Int){
        var arrStr = s.map{$0}
        var i = start
        var j = end
        while i<j {
            let temp = arrStr[i];
            arrStr[i] = arrStr[j]
            arrStr[j] = temp
            i += 1
            j -= 1
        }
        var temp = ""
        for s in arrStr {
            temp.append(String(s))
        }
        s = temp
    }
    
    //逆波兰表达式
    func evalRPN(_ tokens: [String]) -> Int {
        let stack = Stack<Int>()
        
        for i in 0..<tokens.count {
            let str = tokens[i]
            if str == "+" || str == "-" || str == "*" || str == "/"{
                //取出栈中前两个数据
                let num1 = stack.top()
                stack.pop()
                let num2 = stack.top()
                stack.pop()
                var result:Int = 0
                if str == "+" {
                    result = num2! + num1!
                }
                if str == "-" {
                    result = num2! - num1!
                }
                if str == "*" {
                    result = num2! * num1!
                }
                if str == "/" {
                    result = num2! / num1!
                }
                stack.push(result)
                
            }else{
                stack.push(Int(str)!)
            }
        }
        
        let result = stack.top()
        stack.pop()
        return result!;
    }
    
    
    //滑动窗口的最大值
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let queue = SignlQueue()
        var result = Array<Int>()
        
        // 先将前k的元素放进队列
        for i in 0..<k {
            queue.push(nums[i])
        }
        
        result.append(queue.front()!)

        //开始滑动
        for i in k..<nums.count {
            //滑动窗口移除最前面元素
            queue.pop(nums[i-k])
            //滑动窗口前加入最后面的元素
            queue.push(nums[i])
            result.append(queue.front()!)
        }
        
        return result
    }
}


//单调队列 （从大到小）
class SignlQueue {
    var queue:Queue<Int> = Queue<Int>()
    
    // 每次弹出的时候，比较当前要弹出的数值是否等于队列出口元素的数值，如果相等则弹出。
    // 同时pop之前判断队列当前是否为空。
    func pop(_ value:Int) {
        if !queue.isEmpty && queue.peek() == value{
            queue.pop()
        }
    }
    
    //如果push的数值大于入口元素的数值，那么就将队列后端数值弹出，直到push的数值小于等于队列入口元素
    func push(_ value:Int) {
        while !queue.isEmpty && value > queue.back()! {
            queue.pop_back()
        }
        //添加到队头
        queue.push(value)
    }
    
    //查询当前最大值
    func front() -> Int? {
        if queue.isEmpty {
            return nil
        }else{
            return queue.peek()!
        }
    }
}
