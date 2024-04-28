//
//  URLExt.swift
//  AMtime
//
//  Created by Sherlock Zhao on 28/4/2024.
//

import SwiftUI

extension URL {
    private static let baseImageUrl = ProcessInfo.processInfo.environment["API_BASE_IMAGE_URL"] ?? ""
    private static let backdropSize = "w780"
    private static let posterSize = "w342"

    private static let apiKey = ProcessInfo.processInfo.environment["API_KEY"] ?? ""
    private static let baseUrl = ProcessInfo.processInfo.environment["API_BASE_URL"] ?? ""

    static func movies(for section: HomeSection, page: Int) -> URL {
        URL(string: "\(String(describing: baseUrl))/\(section.rawValue.replacingOccurrences(of: " ", with: "_").lowercased())?api_key=\(String(describing: apiKey))&language=en-US&page=\(page)")!
    }

    static var topRated: URL {
        URL(string: "\(String(describing: baseUrl))/top_rated?api_key=\(String(describing: apiKey))&language=en-US&page=2")!
    }

    static var upcoming: URL {
        URL(string: "\(String(describing: baseUrl))/upcoming?api_key=\(String(describing: apiKey))&language=en-US&page=2")!
    }

    static var popular: URL {
        return URL(string: "\(String(describing: baseUrl))/popular?api_key=\(String(describing: apiKey))&language=en-US&page=2")!
    }

    static var nowPlaying: URL {
        URL(string: "\(String(describing: baseUrl))/now_playing?api_key=\(String(describing: apiKey))&language=en-US&page=2")!
    }

    static func movie(with id: Int) -> URL {
        return URL(string: "\(String(describing: baseUrl))/\(id)?api_key=\(String(describing: apiKey))&language=en-US&page=2")!
    }
}
