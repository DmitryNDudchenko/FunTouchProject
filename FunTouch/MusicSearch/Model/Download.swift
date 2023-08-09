//
//  Download.swift
//  FunTouch
//
//  Created by Дмитрий on 15.02.2023.
//
//

import Foundation

class Download {

    var track: Track
    var task: URLSessionDownloadTask?
    var resumeData: Data?
    var progress: Float = 0
    var isDownloading = false

    init(track: Track){
        self.track = track
    }




}
