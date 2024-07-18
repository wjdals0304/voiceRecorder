//
//  MemoViewModel.swift
//  voiceRecorder
//
//  Created by tony on 7/18/24.
//

import Foundation

class MemoViewModel: ObservableObject {
    @Published var memo: Memo
    
    init(memo: Memo) {
        self.memo = memo
    }
}
