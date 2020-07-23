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
        
        let array:[Int]=[7,4,9,2,5,8,11,3]

        let tree=BinarySearchTree<Int>()
        tree.add(element: 7)
        tree.add(element: 4)
        tree.add(element: 9)
        tree.add(element: 2)
        tree.add(element: 5)
        tree.add(element: 8)
        tree.add(element: 11)
        tree.add(element: 3)
        print("\(tree.sizeFun())")
//        for  (item,num) in array.enumerated(){
//            print("\(num)")
//
//        }
        tree.preorderTraversal()
//        let tree=BinarySearchTree<Person>()
//        tree.add(element: Person(7))
//        tree.add(element: Person(4))
//        tree.add(element: Person(9))
//        tree.add(element: Person(2))
//        tree.add(element: Person(5))
//        tree.add(element: Person(8))
    }


}

