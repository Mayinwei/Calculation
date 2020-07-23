//
//  BinarySearchTree.swift
//  Calculation
//
//  Created by 魏庆洁 on 2020/7/19.
//  Copyright © 2020 Ma. All rights reserved.
//  二叉搜索树

import UIKit

class BinarySearchTree<T:Compactor>: NSObject {
    
    private var size:Int = 0
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
                node=node!.right
            }else if comp<0{
                node=node!.left
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
    
    
    //前序遍历:先遍历根节点，左子树，右子树
    func preorderTraversal() {
        preorderTraversal(node: root)
    }
    
    
    private func preorderTraversal(node:Node<T>?){
        guard let node=node else{
            return
        }
        print("前序节点=\(String(describing: node.element))")
        preorderTraversal(node:node.left)
        preorderTraversal(node:node.right)

    }
    
    //中序遍历:把根节点放在中间，先访问左右哪个子树都行，最终结果是从左在前【小到大】正序排列，右在前是从大到小
    func inorderTraversal(){
        inorderTraversal(node: root)
    }
    private func inorderTraversal(node:Node<T>?){
        guard let node=node else{
            return
        }
        inorderTraversal(node:node.left)
        print("中序遍历=\(String(describing: node.element))")
        inorderTraversal(node:node.right)
    }
    
    
    //层序遍历
    /**
     1.通过队列的形式实现层层遍历
     2.将根节点插入队列中
     3.循环如下操作
        3.1，将队头节点A出队，进行访问
        3.2，将A的左子节点入队，
        3.3，遍历完A的左子节点，将右子节点入队
     4.效果，达到默写程度
     */
    func levelorderTraversal() {
        guard let root=root else {
            return
        }
        var queue:[Node<T>]=Array()
        queue.append(root)
        while queue.count>0 {
            let nodeFirst=queue.first
            print("层序遍历=\(String(describing: nodeFirst?.element))")
            queue.remove(at: 0)
            if let node = nodeFirst?.left  {
                queue.append(node)
            }
            
            if let node = nodeFirst?.right {
                queue.append(node)
            }
            
        }
        
    }
    
    
    /// 比较两个节点
    /// - Parameters:
    ///   - element1: 参数1
    ///   - element2: 参数2
    /// - Returns: 比较结果：0是相等。大于0，e1>e2。小于0,e1<e2
    private func compare(element1:T,element2:T)->Int
    {
        if element1 is Int {
            let a=(element1 as! Int)-(element2 as! Int)
            return a
        }else{
            return 0;
        }
    }
}
