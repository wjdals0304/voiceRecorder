//
//  HomeViewModel.swift
//  voiceRecorder
//
//  Created by tony on 7/8/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var selectedTab: Tab
     
    init(selectedTab: Tab) {
        self.selectedTab = selectedTab
    }

}


