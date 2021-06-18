//
//  TreeNode.swift
//  Calculation
//
//  Created by 魏庆洁 on 2020/7/28.
//  Copyright © 2020 Ma. All rights reserved.
//
//link: https://leetcode-cn.com/problems/invert-binary-tree/
import UIKit

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }
