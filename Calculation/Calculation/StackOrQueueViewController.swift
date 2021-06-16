//
//  StackOrQueueViewController.swift
//  Calculation
//
//  Created by 马银伟 on 2021/6/16.
//  Copyright © 2021 Ma. All rights reserved.
//

import UIKit

class StackOrQueueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
//        let st = Stack<Int>()
//        st.push(10)
//        st.push(11)
//        st.push(12)
//        st.push(13)
//        st.push(14)
//        st.push(15)
//
//        print(st.pop())
//        print(st.count)
        
        let q = MyQueue()
        q.push(1)
        q.pop()
    }
    

    

}
