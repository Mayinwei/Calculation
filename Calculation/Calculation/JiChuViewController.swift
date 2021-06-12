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
        
        let array = [-4,-1,0,4,11,13,33]
        let result = sortedSquares(nums: array)
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
}
