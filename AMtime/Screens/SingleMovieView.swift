//
//  SingleMovieView.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import SwiftUI

struct SingleMovieView<T: Movie>: View {
    var movie: T

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                createPosterImage()
                MovieDetailView(movie: self.movie)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }

    // Creates and styles the poster image view
    fileprivate func createPosterImage() -> some View {
        Image(uiImage: UIImage(named: "\(movie.image).jpg") ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

// Preview Provider
struct SingleMovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView<Popular>(movie: Popular.default)
    }
}
