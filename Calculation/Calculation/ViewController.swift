//
//  ViewController.swift
//  Calculation
//
//  Created by 魏庆洁 on 2020/7/19.
//  Copyright © 2020 Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor=UIColor.red
        
        let array:[Int]=[7,4,9,2,1,3,5,8,11,10,12]
        let tree=BinarySearchTree<Int>()
        for  num in array{
            tree.add(element: num)
        }
        print("整体节点")
        print(tree.printTree())
        tree.remove(element: 5)
        print("\n\n\n")
        print(tree.printTree())
//        //中序遍历
//        tree.inorderTraversal()
//        //前序遍历
//        tree.preorderTraversal { (element) -> Bool in
//
//            if element==8 {
//                return true
//            }else{
//                print("前序遍历=\(element)")
//                return false
//            }
//        }
        
        
//        tree.levelOrder { (element) -> (Bool) in
//            var a=0
//            if element==8 {
//                return true
//            }else{
//                a+=1
//                print("\(element)---a=\(a)")
//                return false
//            }
//        }
    }


    //前序遍历
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        
        guard let root = root else {
            return nil
        }
        
        let temp=root.left
        root.left=root.right
        root.right=temp
        
        invertTree(root.left)
        invertTree(root.right)
        
        
        return root
    }
    
    //层序遍历
    func invertTree2(_ root: TreeNode?) -> TreeNode? {
        
        guard let root = root else {
            return nil
        }
        
        var queue:[TreeNode]=Array()
        queue.append(root)
        
        while queue.count>0 {
            let nodeFirst=queue.first
            queue.remove(at: 0)
            let temp=nodeFirst!.left
            nodeFirst!.left=nodeFirst!.right
            nodeFirst!.right=temp
            if nodeFirst?.left != nil {
                queue.append(nodeFirst!.left!)
            }
            
            if nodeFirst?.right != nil {
                queue.append(nodeFirst!.right!)
            }
            
            
            
        }
        
        return root
    }
    
}

