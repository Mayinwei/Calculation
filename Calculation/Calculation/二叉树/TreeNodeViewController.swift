//
//  TreeNodeViewController.swift
//  Calculation
//
//  Created by Admin on 2021/6/18.
//  Copyright © 2021 Ma. All rights reserved.
//

import UIKit

class TreeNodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        
    }
    
    //迭代法，前序遍历
    func preorderTraversal(_ root:TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var result = Array<Int>()
        let stack = Stack<TreeNode>()
        stack.push(root)
        while !stack.isEmpty {
            //因为出栈顺序是反的所以是
            //中
            let treeNode = stack.top()
            stack.pop()
            result.append(treeNode!.val)
            //右
            if let right = treeNode?.right{
                stack.push(right)
            }
            //左
            if let left = treeNode?.left {
                stack.push(left)
            }
            
        }
        return result
    }

    //中序迭代:
    func inorderTraversal(_ root:TreeNode?) -> [Int] {
        if root == nil{
            return []
        }
        var result = Array<Int>()
        let st = Stack<TreeNode>()
        var cur = root
        while cur != nil || !st.isEmpty {
            if cur != nil {
                //前
                st.push(cur!.left!)
            }else{
                let treeNode = st.top()
                st.pop()
                //中
                result.append(treeNode!.val)
                //右
                cur = treeNode?.right
            }
        }
        return result
    }
}
