//
//  TodoListViewModel.swift
//  voiceRecorder
//
//  Created by tony on 7/8/24.
//

import SwiftUI

final class TodoListViewModel: ObservableObject {
    @Published var todos: [Todo]
    
    init(
        todos: [Todo] = []
    ) {
        self.todos = todos
    }
    
}

extension TodoListViewModel {
    
    func addTodo(_ todo: Todo) {
        todos.append(todo)
    }
    
}
