//
//  DownloadService.swift
//  FunTouch
//
//  Created by Дмитрий on 01.03.2023.
//

import Foundation

class DownloadService {
  //
  // MARK: - Variables And Properties
  //
  var activeDownloads: [URL: Download] = [ : ]

  var downloadsSession: URLSession!

  //
  // MARK: - Internal Methods
  //
  func cancelDownload(_ track: Track) {
    guard let download = activeDownloads[track.previewURL] else {
      return
    }
    download.task?.cancel()

    activeDownloads[track.previewURL] = nil
  }

  func pauseDownload(_ track: Track) {
    guard
      let download = activeDownloads[track.previewURL],
      download.isDownloading
      else {
        return
    }

    download.task?.cancel(byProducingResumeData: { data in
      download.resumeData = data
    })

    download.isDownloading = false
  }

  func resumeDownload(_ track: Track) {
    guard let download = activeDownloads[track.previewURL] else {
      return
    }

    if let resumeData = download.resumeData {
      download.task = downloadsSession?.downloadTask(withResumeData: resumeData)
    } else {
      download.task = downloadsSession?.downloadTask(with: download.track.previewURL)
    }

    download.task?.resume()
    download.isDownloading = true
  }

  func startDownload(_ track: Track) {
    let download = Download(track: track)
    download.task = downloadsSession?.downloadTask(with: track.previewURL)
    download.task?.resume()
    download.isDownloading = true
    activeDownloads[download.track.previewURL] = download
  }
}
