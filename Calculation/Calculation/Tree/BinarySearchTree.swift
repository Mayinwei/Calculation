//
//  BinarySearchTree.swift
//  Calculation
//
//  Created by 魏庆洁 on 2020/7/19.
//  Copyright © 2020 Ma. All rights reserved.
//  二叉搜索树

import UIKit

class BinarySearchTree<T:Compactor>: NSObject {
    
    var size:Int = 0
    private var root:Node<T>? //根节点
//    private var comparable:Compactor? //比较器协议
//    let compactor:Compactor

    
    func sizeFun() -> Int {
        return size
    }
    
    
    func isEmpty()->Bool {
        return size==0
    }
    
    func clear() {
        
    }
    
    //添加节点
    func add(element:T?){
        //判断非空
        guard let element=element else {
            print("传入节点为null")
            return
        }
        
        //添加第一个节点
        if root==nil {
            root=Node(element:element, parent: nil)
            return
        }
        //添加的不是跟节点
        var parent:Node=root!
        var node:Node?=root!
        var comp:Int=0
        while node != nil {
            comp=compare(element1: element, element2: node!.element!)
            parent=node!
            if comp>0{
                node=node!.left
            }else if comp<0{
                node=node!.right
            }else{
                node?.element=element
                return
            }
        }
        
        let nwNode=Node(element: element, parent: parent)
        if comp>0 {
            parent.right = nwNode
        }else{
            parent.left = nwNode
        }
        size+=1
    }
    
    func remove(element:T){
        
    }
    
    func contains(element:T)->Bool{
        
        return false
    }
    
    func preorderTraversal() {
        preorderTraversal(node: root)
    }
    
    
    private func preorderTraversal(node:Node<T>?){
        guard let node=node else{
            return
        }
        print(node.element as Any)
        preorderTraversal(node:node.left)
        preorderTraversal(node:node.right)

    }
    
    /// 比较两个节点
    /// - Parameters:
    ///   - element1: 参数1
    ///   - element2: 参数2
    /// - Returns: 比较结果：0是相等。大于0，e1>e2。小于0,e1<e2
    private func compare(element1:T,element2:T)->Int
    {
//        element1.comp T.Type.self == Int.Type.self
//      return   element1.compareTo(element2)
        if element1 is Int {
            let a=(element1 as! Int)-(element2 as! Int)
            return a
        }else{
            return 0;
//            return element1.compareTo(element2)
//            return element1.compareTo(e2: T.self as! T)
//            element1.compareTo(element2)
//            return element1.compareTo(element2: T.Type.self as! T.T)
        }
    }
}
