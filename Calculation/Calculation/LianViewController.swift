//
//  LianViewController.swift
//  Calculation
//
//  Created by 马银伟 on 2021/6/14.
//  Copyright © 2021 Ma. All rights reserved.
//  链表

import UIKit

class LianViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor=UIColor.white
        let node3 = ListNode(vals: 3, nexts: nil)
        let node2 = ListNode(vals: 2, nexts: node3)
        let node = ListNode(vals: 1, nexts: nil)
        
        let result = removeNthFromEnd(node, 1);
        print(result?.printNode())
    }
    
    //【1】删除节点中的元素,并返回新的头节点
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        //设置虚拟头节点来删除
        let dummyHead = ListNode()
        dummyHead.next = head
        
        //设置中间变量
        var cur:ListNode = dummyHead
        while cur.next != nil {
            if cur.next?.val == val {
                //删除该节点
                cur.next = cur.next?.next
            }else{
                cur = cur.next!
            }
        }
        return dummyHead.next
    }
    
    //【2】翻转链表,使用双指针法
    func reverseList(_ head: ListNode?) -> ListNode? {
        var tempNode:ListNode? = nil
        var cur = head
        var pre:ListNode? = nil
        
        while cur != nil {
            tempNode = cur?.next
            cur?.next = pre
            pre = cur
            cur = tempNode
        }
        return pre
    }
    
    //【3】两两交换相邻节点[1,2,3,4,5]
    func swapPairs(_ head: ListNode?) -> ListNode? {
        //设置虚拟头节点
        let dummyHead = ListNode()
        //设置虚拟头节点指向head
        dummyHead.next = head
        //设置中间变量
        var cur = dummyHead
        while cur.next != nil && cur.next?.next != nil {
            //记录临时节点
            let temp = cur.next
            //记录临时节点
            let temp1 = cur.next?.next?.next
            
            //步骤1(临时节点指向2)
            cur.next = cur.next?.next
            cur.next?.next = temp
            cur.next?.next?.next = temp1
            
            //移动两位，准备下一轮
            cur = (cur.next?.next!)!
        }
        
        return dummyHead.next
    }
    
    
    //【4】删除倒数第n个节点
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var tempN = n
        let dummpNode = ListNode()
        dummpNode.next = head
        var fastNode:ListNode? = dummpNode
        var slowNode:ListNode? = dummpNode
        
        //先走n步
        while tempN > 0 && fastNode != nil {
            tempN -= 1
            fastNode = fastNode?.next
        }
        //在提前走一步
        fastNode = fastNode?.next
        
        while fastNode != nil {
            fastNode = fastNode?.next
            slowNode = slowNode?.next
        }
        //此时就找到了，被删除节点的父节点
        slowNode?.next = slowNode?.next?.next
        return dummpNode.next
    }
}

class ListNode {
    var val:Int = 0
    var next:ListNode?
    init() {
        val = 0
        next = nil
    }
    
    init(vals:Int) {
        val = vals
    }
    
    init(vals:Int,nexts:ListNode?) {
        val = vals
        next = nexts
    }
    
    //打印节点
    func printNode() {
        var jie = "head->"
        var temp:ListNode? = self
        while  temp != nil {
            jie.append(String(temp!.val)+",")
            temp = temp?.next
        }
        jie.append("->Null")
        print(jie)
    }
}
