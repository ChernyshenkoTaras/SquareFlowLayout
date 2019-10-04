//
//  ImageLoader.swift
//  SquareFlowLayout
//
//  Created by Taras Chernyshenko on 11/11/18.
//  Copyright © 2018 Taras Chernyshenko. All rights reserved.
//

import UIKit

final class ImageLoader {
    private static let loadingQueue = DispatchQueue(label: "image.loading.queue")
    static func load(from url: URL, completion: @escaping (UIImage?) -> ()) {
        self.loadingQueue.async {
            do {
                let cache = ImageCache(path: url.lastPathComponent)
                var data: Data
                if cache.isExist {
                    data = try Data(contentsOf: cache.cacheURL)
                } else {
                    data = try Data(contentsOf: url)
                    cache.save(data)
                }
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}

final class ImageCache {
    public enum MimeType: String {
        case jpg
    }
    private let path: String
    private let mimeType: MimeType
    private let fileManager = FileManager.default
    
    public lazy var cacheURL: URL = {
        let videoDirectory = self.getCacheDirectoryPath().appendingPathComponent("images")
        if !self.fileManager.fileExists(atPath: videoDirectory.path) {
            do {
                try self.fileManager.createDirectory(at: videoDirectory, withIntermediateDirectories: true, attributes: nil)
            } catch {
                assertionFailure(error.localizedDescription)
            }
        }
        return videoDirectory.appendingPathComponent("\(self.path).\(self.mimeType.rawValue)")
    }()
    
    init(path: String, mimeType: MimeType = .jpg) {
        self.path = path
        self.mimeType = mimeType
    }
    
    public var isExist: Bool {
        return self.fileManager.fileExists(atPath: self.cacheURL.path)
    }
    
    public func save(_ data: Data) {
        self.fileManager.createFile(atPath: self.cacheURL.path, contents: data)
    }
    
    private func getCacheDirectoryPath() -> URL {
        let fm = FileManager.default
        let folderName = "SquareFlowLayoutCache"
        let cacheFolderPath = fm.urls(for: .cachesDirectory, in: .userDomainMask).first!.appendingPathComponent(folderName)
        return cacheFolderPath
    }
}
