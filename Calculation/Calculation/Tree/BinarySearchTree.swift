//
//  BinarySearchTree.swift
//  Calculation
//
//  Created by 魏庆洁 on 2020/7/19.
//  Copyright © 2020 Ma. All rights reserved.
//  二叉搜索树

import UIKit

protocol BinarySearchTreeProtocol {
    associatedtype E
    func afterAdd(node:Node<E>);

}
class BinarySearchTree<T:Compactor>: BinaryTree<T>,BinarySearchTreeProtocol{
    typealias E = T
    
    func afterAdd(node: Node<T>) {
        print("ddddddd")
    }

    func contains(element:T)->Bool{

        return false
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
            root=createNode(element: element, parent: nil)
            return
        }
        afterAdd(node: root!)
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
        
        let nwNode=createNode(element: element, parent: parent)
        if comp>0 {
            parent.right = nwNode
        }else{
            parent.left = nwNode
        }
        size+=1
    }
    
    //创建新节点
    func createNode(element:T,parent:Node<T>?) -> Node<T> {
        return Node(element: element, parent: parent)
    }
    
    //根据节点内容删除节点
    func remove(element:T){
        remove(node: node(element: element))
    }
    
    
    
    func remove(node:Node<T>?) {
        guard  var node = node else {
            return
        }

        size -= 1

        //度为2的节点
        if node.haveTowChildren() {
            //找到前驱和后继节点，用值覆盖
            let pre=predecessor(node: node)
            node.element=pre?.element!
            //删除前驱节点
            node=pre!
        }


        //删除node节点，注意，node 的度是1或者0
        let replaceNode=node.left != nil ? node.left! : node.right
        if replaceNode != nil{
            //度为1 的节点，不是有左，就是有右
            replaceNode?.parent=node.parent

            if node.parent == nil {
                root=replaceNode
            }else if node == node.parent?.left {
                node.parent?.left=replaceNode
            }else{
                node.parent?.right=replaceNode
            }

        }else if node.parent == nil{
            //根节点
            root=nil
        }else{
            //node是叶子节点，并且不是根节点
            //判断是左还是右
            if node == node.parent?.right {
                node.parent?.right = nil
            }else{
                node.parent?.left = nil
            }
        }

    }

    
    //根据内容查找节点
    func node(element:T)-> Node<T>?{
        var node=root
        
        while node != nil {
            let comp=compare(element1: element, element2: (node?.element)!)
            if comp == 0{
                return node
            }
            if comp > 0 {
                node=node?.right
            }else{
                node=node?.left
            }
        }
        return nil
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




    //层序遍历
    
//    func levelorderTraversal(block:searchBlock) {
//        guard let root=root else {
//            return
//        }
//        var queue:[Node<T>]=Array()
//        queue.append(root)
//        while queue.count>0 {
//            let nodeFirst=queue.first
//            let result = block((nodeFirst?.element!)!)
//            if result {
//                return
//            }
//            queue.remove(at: 0)
//            if let node = nodeFirst?.left  {
//                queue.append(node)
//            }
//
//            if let node = nodeFirst?.right {
//                queue.append(node)
//            }
//
//        }
//
//    }

    





    
}

