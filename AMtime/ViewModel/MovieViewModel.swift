//
//  ViewModel.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import SwiftUI

enum HomeSection: String, CaseIterable {
    case NowPlaying = "Now playing"
    case Popular
    case Upcoming
    case TopRated = "Top rated"
}

struct MovieViewModel: Identifiable {
    var id: Int
    var title: String
    var releaseDate: String
    var overview: String
    var popularity: CGFloat
    var genres: [String]
    var voteAverage: Double = 0
    var originalLanguage: String
    var posterUrl: URL
    var backdropUrl: URL
    var runtime: String
    var productionCompany: String

    private let baseImageUrl = ProcessInfo.processInfo.environment["API_BASE_IMAGE_URL"]
    private let backdropSize = "w780"
    private let posterSize = "w342"

    static var `default`: MovieViewModel {
        MovieViewModel(movie: Movie(id: 0, title: "", releaseDate: "", overview: "", popularity: 0, genres: [], voteAverage: 0, originalLanguage: "", posterPath: "", backdropPath: "", voteCount: 0, status: "", runtime: 0, revenue: 0, budget: 0, productionCompanies: []))
    }

    init(movie: Movie) {
        id = movie.id!
        title = movie.title ?? "N/A"
        releaseDate = movie.releaseDate ?? "No date"
        overview = movie.overview ?? "No overview"
        popularity = movie.popularity ?? 0
        genres = movie.genres?.map({ $0.name }) ?? []
        originalLanguage = movie.originalLanguage ?? "N/A"
        backdropUrl = MovieViewModel.backdropImageUrl(with: movie.backdropPath ?? "", baseUrl: baseImageUrl ?? "", size: backdropSize)
        posterUrl = MovieViewModel.posterImageUrl(with: movie.posterPath ?? "", baseUrl: baseImageUrl ?? "", size: posterSize)
        runtime = MovieViewModel.formatTime(from: movie.runtime ?? 0)
        productionCompany = MovieViewModel.productionCompany(movie: movie)

        if let avarage = movie.voteAverage, avarage > 0 {
            voteAverage = Double(avarage) / 2
        }
    }

    private static func posterImageUrl(with path: String, baseUrl: String, size: String) -> URL {
        if let url = URL(string: "\(baseUrl)\(size)\(path)") {
            return url
        }

        return URL(string: "https://via.placeholder.com/150/0000FF/808080?Text=No&image&available")!
    }

    private static func backdropImageUrl(with path: String, baseUrl: String, size: String) -> URL {
        if let url = URL(string: "\(baseUrl)\(size)\(path)") {
            return url
        }

        return URL(string: "https://via.placeholder.com/150/0000FF/808080?Text=No&image&available")!
    }

    private static func productionCompany(movie: Movie) -> String {
        if let prodCompanies = movie.productionCompanies, !prodCompanies.isEmpty {
            return prodCompanies.first?.name ?? "N/A"
        }

        return "N/A"
    }

    private static func formatTime(from runtime: Int) -> String {
        if runtime == 0 {
            return "00h:00min"
        }
        let hour = runtime / 60
        let min = runtime % 60
        return "\(hour)h : \(min)min"
    }
}
