//
//  KMPViewController.swift
//  Calculation
//
//  Created by 马银伟 on 2021/6/15.
//  Copyright © 2021 Ma. All rights reserved.
//  KMP算法

import UIKit

class KMPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor=UIColor.white
        
//        var str = "aabaaf"
//        var next:Array<Int> = Array<Int>(repeating: -1, count: str.count)
//
//        getNext(next: &next, s: &str)
//        print(next)
        
//        let result = strStr("aabaabaafa", "aabaaf")
//        print(result)
        
        let result = repeatedSubstringPattern("asdfasdfasdf")
        print(result)
    }
    
    //获取next表
    func getNext(next:inout Array<Int>,s:inout String) -> Void {
        //初始化
        var j = -1
        next[0] = j
        let sArr:Array<Character> = s.map{$0}
        for i in 1..<sArr.count {//从1开始匹配
            //前后缀不相同时
            while j >= 0 && String(sArr[i]) != String(sArr[j+1]) {
                //向前回退
                j = next[j]
            }
            
            //相同前后缀
            if String(sArr[i]) == String(sArr[j+1])   {
                j += 1
            }
            //将j（前缀长度）赋值给next[i]
            next[i] = j
        }
    }
    
    //匹配字符串
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count == 0 {
            return 0
        }
        var newNeedle = needle
        let haArray = haystack.map{$0}
        let needArray = needle.map{$0}
        //获取next表
        var next:Array<Int>=Array<Int>(repeating: 0, count: needle.count)
        getNext(next: &next, s: &newNeedle)
        var j = -1 //因为next起始位置就是-1
        for i  in 0..<haystack.count {
            //匹配不相同情况
            while j>=0 && haArray[i] != needArray[j+1] {
                // j 寻找之前匹配的位置
                j = next[j]
            }
            
            //匹配到同时向后移动
            if haArray[i] == needArray[j+1] {
                j += 1
            }
            
            if j == needArray.count-1{
                //文本串中出现了模式串
                return i-needArray.count+1
            }
        }
        //没有匹配的
        return -1
    }
    
    //判断字符串中是否有重复子串
    func repeatedSubstringPattern(_ s: String) -> Bool {
        var next=Array<Int>(repeating: -1, count: s.count)
        var newS = s
        getNext(next: &next, s: &newS)
        
        let len = next.count
        
        if next[len-1] != -1 && len % (len-(next[len-1]+1)) == 0 {
            return true
        }
        return false
    }
    
    
}
