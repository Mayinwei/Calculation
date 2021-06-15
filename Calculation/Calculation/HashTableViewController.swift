//
//  HashTableViewController.swift
//  Calculation
//
//  Created by Admin on 2021/6/15.
//  Copyright © 2021 Ma. All rights reserved.
//  哈希

import UIKit

class HashTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor=UIColor.white
        
//        let result = isAnagram("aae", "aea")
//        print(result)
//
//        var s:[Character] = ["a","b","c","d","e"]
//        reverseString(&s)
//        print(s)
        
//        let result = replaceSpace(" we are the world")
//        print(result)
        
        let a = "ssss"
//        fanStr(s: &a, start: 0, end: a.count-1)
//       let result =  reverseWords(a)
//        print(result)
        
        let result = reverseLeftWords("abcdefg", 3)
        print(result)
    }
    

    //【1】字符串异或
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var array = Array<Int>(repeating: 0, count: 26);
        
        for c in s.unicodeScalars {
            let num = c.value
            let can:Character = "a"
            let index=num-UInt32(can.asciiValue!)
            array[Int(index)] += 1
        }
        
        for c in t.unicodeScalars {
            let num = c.value
            let can:Character = "a"
            let index=num-UInt32(can.asciiValue!)
            array[Int(index)] -= 1
        }
        
        for result in array {
            if result != 0 {
                return false
            }
        }
        //都为零
        return true
     }
    
    //双指针翻转字符串
    func reverseString(_ s: inout [Character]) {
        var right = s.count
        for left in 0..<s.count {
            right -= 1
            let temp = s[right];
            if left <= right {
                s[right] = s[left]
                s[left] = temp
            }
        }
    }
    
    //替换字符串中的空格
    func replaceSpace(_ s: String) -> String {
        //统计空格数量
        var count = 0
        let oldSize = s.unicodeScalars.count
        var arr = Array<Character>()
        for c in s {
            if String(c) == " " {
                count += 1
            }
            arr.append(c)
        }
        
        //重新
        arr = arr + Array<Character>(repeating: Character("1"), count: count*2)
        
        let newSize = arr.count
        //从后先前将空格替换为"%20"
        var i = newSize-1
        var j = oldSize-1
        while j<i && j>=0 {
            //判断是否为空格
            if String(arr[j]) != " " {
                arr[i] = arr[j]
            }else{
                //变成%20
                arr[i] = "0"
                arr[i-1] = "2"
                arr[i-2] = "%"
                i -= 2
            }
            i -= 1
            j -= 1
            print(j)
        }
        
        var result = ""
        for c in arr {
            result.append(String(c))
        }
        
        return result
    }
    
    //花式翻转
    
    //【1】移除冗余空格：使用双指针（快慢指针法）O(n)的算法
    func removeExtraSpaces(s:inout String) {
        let arrStr = s.map{$0}
        var start = 0
        var end = arrStr.count-1
        //头部空格
        while String(arrStr[start]) == " " {
            start += 1
        }
        
        //尾部空格
        while String(arrStr[end]) == " " {
            end -= 1
        }
        
        var sb = ""
        var array = Array<String>()
        while start <= end {
            let c = arrStr[start]
            if String(c) != " " || array[array.count-1] != " " {
                sb.append(String(c))
                array.append(String(c))
            }
            start += 1
        }
        s = sb
    }
    
    //【2】翻转字符串
    func fanStr(s:inout String,start:Int,end:Int,arrStr:inout Array<Character>){
        var i = start
        var j = end
//        var arrStr = s.map{$0}
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
    
    
    
    
    //【3】翻转单词
    func reverseWords(_ s: String) -> String {
        var newS = s
        //移除多余空格
        removeExtraSpaces(s: &newS)
        var arrayStr = newS.map{$0}
        //翻转字符串
        fanStr(s: &newS, start: 0, end: newS.count-1,arrStr: &arrayStr)
        
        var start = 0 //翻转的单词在字符串的起始位置
        var end  = 0 //翻转的单词在字符串结束的位置
        var entry = false // 标记枚举字符串的过程中是否已经进入了单词区间
        for i in 0..<newS.count {
            if !entry {
                start = i
                entry = true
            }
            
            //确定空格就是单词结束的标志
            if entry && String(arrayStr[i]) == " " && String(arrayStr[i-1]) != " "{
                end = i-1 //确定单词终止位置
                entry = false
                //开始翻转
                fanStr(s: &newS, start: start, end: end,arrStr: &arrayStr)
            }
            
            // 单词后面没有空格，就是结尾了
            if entry && (i == arrayStr.count-1) && String(arrayStr[i]) != " "{
                end = arrayStr.count-1
                entry = false
                fanStr(s: &newS, start: start, end: end,arrStr: &arrayStr)
            }
        }
        
        return newS
    }
    
    
    //字符串左旋转
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        var newStr = s
        var array = s.map{$0}
        //先翻转n前面
        fanStr(s: &newStr, start: 0, end: n-1, arrStr: &array)
        
        //先翻转n后面
        fanStr(s: &newStr, start: n, end: array.count-1, arrStr: &array)
        
        //在翻转整个
        fanStr(s: &newStr, start: 0, end: array.count-1, arrStr: &array)
        
        return newStr
    }
    
    
}
