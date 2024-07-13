//
//  TodoViewModel.swift
//  voiceRecorder
//
//  Created by tony on 7/13/24.
//

import Foundation

final class TodoViewModel: ObservableObject {
    
    @Published var title: String
    @Published var time: Date
    @Published var day: Date
    @Published var isDisPlayCalendar: Bool
    
    init(title: String = "", time: Date = Date() , day: Date = Date() , isDisPlayCalendar: Bool = false) {
        self.title = title
        self.time = time
        self.day = day
        self.isDisPlayCalendar = isDisPlayCalendar
    }
    }

extension TodoViewModel {
    func setIsDisplayCalendar(_ isDisplay: Bool) {
        isDisPlayCalendar = isDisplay
    }
}
