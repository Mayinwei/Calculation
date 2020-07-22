//
//  Person.swift
//  Calculation
//
//  Created by 魏庆洁 on 2020/7/20.
//  Copyright © 2020 Ma. All rights reserved.
//

import UIKit

class Person: NSObject,Compactor{
    
    typealias T = Person
    
    var age:Int=0
    
    init(_ age:Int) {
        super.init()
        self.age=age
    }
    func compareTo(_ element2: Person) -> Int {
        return self.age-element2.age
    }
    
}
