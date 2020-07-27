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
        
//        let array:[Int]=[7,4,9,2,1,3,5,8,11,10,12]
        let array:[Int]=[7,4,9,2]
        let tree=BinarySearchTree<Int>()
        for  num in array{
            tree.add(element: num)
        }
        print(tree.isComlpete())
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


}

