//
//  todo.swift
//  Apiproject
//
//  Created by Elnoby on 3/30/20.
//  Copyright © 2020 elnoubi. All rights reserved.
//

import Foundation

struct Todos: Codable {
    let items: Array<Todo>
}

struct Todo: Codable {
    let item: String
    let priority: Int
}

