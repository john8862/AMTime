//
//  MovieListingViewModel.swift
//  AMtime
//
//  Created by Sherlock Zhao on 28/4/2024.
//

import Combine
import SwiftUI

class MovieListingViewModel: ObservableObject {
    private var webService = WebService()
    private var cancellableSet: Set<AnyCancellable> = []

    @Published var sectionMovies = [HomeSection: [MovieViewModel]]()
    @Published var movie = MovieViewModel.default
    @Published var paginatedMovies = [MovieViewModel]()

    func getSectionMovies() {
        webService
            .getSectionsPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { status in
                switch status {
                case .finished:
                    break
                case let .failure(error):
                    print(error)
                    break
                }
            }) { topRated, upcoming, popular, nowPlaying in
                self.sectionMovies[.TopRated] = topRated.results.map(MovieViewModel.init)
                self.sectionMovies[.Upcoming] = upcoming.results.map(MovieViewModel.init)
                self.sectionMovies[.Popular] = popular.results.map(MovieViewModel.init)
                self.sectionMovies[.NowPlaying] = nowPlaying.results.map(MovieViewModel.init)
            }.store(in: &cancellableSet)
    }

    func getPaginatedMovies(for section: HomeSection, page: Int) {
        webService.getPaginatedPublisher(for: section, page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { status in
                switch status {
                case .finished:
                    break
                case let .failure(error):
                    print(error)
                    break
                }
            }) { page in
                self.paginatedMovies.append(contentsOf: page.results.map(MovieViewModel.init))
            }.store(in: &cancellableSet)
    }
    
    func getMovieDetail(id: Int)  {
        webService.getMovieDetailPublisher(for: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { status in
               switch status {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                    break
                }
            }) { movie in
                self.movie = MovieViewModel(movie: movie)
        }.store(in: &self.cancellableSet)
    }
}
