//
//  Todo.swift
//  Todos
//
//  Created by 谢庭宇 on 2021/8/31.
//

import Foundation

//class Todo{
//    var name = ""
//    var checkd = false
//    init(<#parameters#>) {
//        <#statements#>
//    }
//}

//结构体，约等于class-不需要init，轻量级class
struct Todo : Codable {
    var name = " "
    var checked = false
}
