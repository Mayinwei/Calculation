//
//  JiChuViewController.swift
//  Calculation
//
//  Created by 马银伟 on 2021/6/12.
//  Copyright © 2021 Ma. All rights reserved.
//  基础算法演练

import UIKit

class JiChuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        //【1】二分查找
//        let array = [0,1,2,3,4,5,6,7,8,9]
//        let result = search(nums: array, target: 4)
//        print("二分查找结果的坐标为\(result)");
        
        //【2】覆盖数值中目标值，保持相对顺序不变(快慢指针)
//        let array = [0,2,2,1,4,2,3]
//        let result = removeElement(nums: array,target: 2)
//        print(result);
        
        //【3】数组结果平方，排序
//        let array = [-4,-1,0,4,11,13,33]
//        let result = sortedSquares(nums: array)
//        print(result)
        
        //【4】滑动窗口
//        let array = [2,3,1,2,4,3]
//        let result = minSubArrayLen(target:7, nums: array)
//        print(result)
        
        //滑动窗口变种
//        let result = minSubArrayLen(s: "ABDXDFTEDFFD", t: "FD")
//        print(result)
        
        //数组转圈
        let result = generateMatrix(n: 3)
        print(result)
    }
    
    
    //【1】二分查找
    func search(nums:[Int],target:Int) -> Int {
        var left = 0
        // 定义target在左闭右闭的区间里，[left, right]
        var right = nums.count-1
        while left <= right {
            // 防止溢出 等同于(left + right)/2
            let middle  = left+((right-left)/2)
            
            if nums[middle] > target {
                // target 在左区间，所以[left, middle - 1]
                right = middle - 1
            }else if nums[middle] < target {
                // target 在右区间，所以[middle + 1, right]
                left = middle + 1
            }else{
                // nums[middle] == target
                return middle; // 数组中找到目标值，直接返回下标
            }
        }
        //未找到
        return -1
    }
    
    //【2】移除数组中目标元素，并保持相对位置,并返回新数组长度
    func removeElement(nums:[Int],target:Int) -> Int {
        var newNums = nums
        var slowIndex = 0
        for fastIndex in 0..<newNums.count {
            if target != newNums[fastIndex] {
                newNums[slowIndex] = newNums[fastIndex]
                slowIndex += 1
            }
        }
        return slowIndex
    }
    
    
    //【3】有序数组的平方
    func sortedSquares(nums:[Int]) -> [Int] {
        var k = nums.count-1
        var result = Array<Int>(repeating: 1, count: nums.count)
        var j = nums.count-1
        var i = 0
        while i<=j {
            if nums[i]*nums[i] < nums[j]*nums[j] {
                result[k] = nums[j]*nums[j]
                k -= 1
                j -= 1
            }else {
                result[k] = nums[i]*nums[i]
                k -= 1
                i += 1
            }
        }
        
        return result
    }
    
    
    //【4】滑动窗口（快慢指针的一种）,并返回其最小子集合的长度
    func minSubArrayLen(target:Int,nums:[Int]) -> Int64 {
        var result = INT64_MAX
        var sum = 0 //相加之和
        var i = 0 //起始位置
        var subLength = 0 //滑动窗口的长度
        for j in 0..<nums.count {
            sum += nums[j]
            //注意这里使用while ，每次更新i的位置，并不断比较子序列之和是否符合条件
            while sum >= target {
                subLength =  j-i+1
                //比较是否为最小的
                result = Int64(result < subLength ? Int(result) : subLength)
                //变更i的起始位置
                sum -= nums[i]
                i += 1
            }
        }
        
        if result == MAXINTERP {
            return 0
        }else{
            return result
        }
    }
    
    //滑动窗口练习，返回最小字符串覆盖
    func minSubArrayLen(s:String,t:String) -> String {
        var result = INT64_MAX
        var sum = ""
        var i = 0
        var j = 0
        var subLength = 0
        for str in s {
            j += 1
            sum += String(str)
            //开始比较
            while sum.contains(t) {
                subLength = j-i+1
                result = Int64(result < subLength ? Int(result) : subLength)
                sum = String(sum.remove(at: sum.index(sum.startIndex, offsetBy: 0)))
                i += 1
            }
        }
        
        return sum
    }
    
    //【5】给定一个整数，画出螺旋图,要坚持 左闭右开 原则
    func generateMatrix(n:Int) -> [[Int]] {
        //定义一个二维数组,n行，n列
        var array2D = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        //定义每循环一圈的起始位置
        var startX = 0,startY = 0
        //需要循环几圈,例如n为奇数3，那么loop = 1 只是循环一圈，矩阵中间的值需要单独处理
        var loop = n/2
        //矩阵中间的位置，例如：n为3， 中间的位置就是(1，1)，n为5，中间位置为(2, 2)
        let mid = n/2
        // 用来给矩阵中每一个空格赋值
        var count = 1
        //每循环一圈，需要控制每条边遍历的长度
        var offSet = 1
        
        var i=0,j=0
        
        while loop > 0  {
            loop -= 1
            i = startX
            j = startY
            
            //下面四个for 循环就是模拟旋转一圈
            
            //模拟填充上行 ，从左到右,x不动，y动
            while j < (startY+n-offSet) {
                array2D[startX][j] = count
                j += 1
                count += 1
                
            }
            while i < startX+n-offSet {
                array2D[i][j] = count
                count += 1
                i += 1
            }
            
            //模拟下行，从右到左
            while j > startY {
                array2D[i][j] = count
                count += 1
                j -= 1
                
            }
            
            //模拟填充左列,从下到上
            while i > startX {
                array2D[i][j] = count
                count += 1
                i -= 1
            }
            
            
            //从第二圈开始的时候，起始位置要各自加1，例如：第一圈起始位置是(0, 0)，第二圈起始位置是(1, 1)
            startX += 1
            startY += 1
            
            // offset 控制每一圈里每一条边遍历的长度
            offSet += 2
        }
        
        
        //判断是否为奇数
        if n%2 != 0 {
            array2D[mid][mid] = count
        }
        
        return array2D
    }
    
    
    
    
}
