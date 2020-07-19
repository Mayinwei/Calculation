//
//  BinarySearchTree.swift
//  Calculation
//
//  Created by 魏庆洁 on 2020/7/19.
//  Copyright © 2020 Ma. All rights reserved.
//  二叉搜索树

import UIKit

class BinarySearchTree<T>: NSObject {
    var size:Int = 0
    var root:Node<T>? //根节点
    func sizeFun() -> Int {
        return size
    }
    
    
    func isEmpty()->Bool {
        return size==0
    }
    
    func clear() {
        
    }
    
    //添加节点
    func add(element:Node<T>?){
        //判断非空
        guard let element=element else {
            print("传入节点为null")
            return
        }
        
        //添加第一个节点
        if root==nil {
            root=Node(element: T.self as! T, parent: nil)
            return
        }
        //添加的不是跟节点
        var parent:Node=root!
        var node:Node=root!
        var comp:Int=0
        while node==nil {
            comp=compare(element1: element, element2: node)
            parent=node
            if comp==0 {
                return
            }else if comp>0{
                node=node.left!
            }else{
                node=node.right!
            }
        }
        
//        let nwNode=Node(element: element, parent: parent)
        if comp>0 {
//            parent.right =
        }else{
//            parent.left = nwNode
        }
    }
    
    func remove(element:T){
        
    }
    
    func contains(element:T)->Bool{
        return false
    }
    
    
    
    /// 比较两个节点
    /// - Parameters:
    ///   - element1: 节点1
    ///   - element2: 节点2
    /// - Returns: 比较结果：0是相等。大于0，e1>e2。小于0,e1<e2
    func compare(element1:Node<T>,element2:Node<T>)->Int
    {
        
        if(element1.element as! Int ==  element2.element as! Int){
            return 0
        }else if (element1.element as! Int > element1.element as! Int){
            return 1
        }else{
            return -1
        }
    }
}
