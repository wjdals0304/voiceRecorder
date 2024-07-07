//
//  PathType.swift
//  voiceRecorder
//
//  Created by tony on 7/7/24.
//

import Foundation

enum PathType: Hashable {
    case homeView
    case todoView
    case memoView(isCreateMode: Bool, memo: Memo?)
}
