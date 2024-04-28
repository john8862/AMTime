//
//  SingleMovieView.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import Kingfisher
import SwiftUI

struct SingleMovieView: View {
    var movieId: Int = -1

    @ObservedObject var model = MovieListingViewModel()

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                createPosterImage()
                MovieDetailView(movie: self.model.movie)
            }
        }.edgesIgnoringSafeArea(.top)
            .onAppear {
                self.model.getMovieDetail(id: self.movieId)
            }
    }

    fileprivate func createPosterImage() -> some View {
        return KFImage(source: .network(model.movie.posterUrl)).resizable()
            .aspectRatio(contentMode: .fit)
    }
}
