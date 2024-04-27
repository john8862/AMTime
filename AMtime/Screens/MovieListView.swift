//
//  MovieListView.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import SwiftUI

struct MovieListView<T: Movie>: View {
    var movies: [T]
    var section: HomeSection

    var body: some View {
        NavigationView {
            List(0 ..< movies.count) { i in
                MovieListRow<T>(movie: self.movies[i])
            }.navigationBarTitle(section.rawValue)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView<Popular>(movies: [], section: .Trending)
    }
}
