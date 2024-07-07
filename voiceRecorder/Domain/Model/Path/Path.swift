//
//  Path.swift
//  voiceRecorder
//
//  Created by tony on 7/7/24.
//

import Foundation

class PathModel: ObservableObject {
    @Published var paths: [PathType]
    
    init(paths: [PathType] = [] ) {
        self.paths = paths
    }    
}
