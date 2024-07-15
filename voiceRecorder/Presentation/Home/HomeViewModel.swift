//
//  HomeViewModel.swift
//  voiceRecorder
//
//  Created by tony on 7/8/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var selectedTab: Tab
    @Published var todosCount: Int
    
    init(
        selectedTab: Tab = .voiceRecorder,
        todosCount: Int = 0
    ) {
        self.selectedTab = selectedTab
        self.todosCount = todosCount
    }
}

extension HomeViewModel {
    func setTodosCount(_ count: Int) {
      todosCount = count
    }
}
