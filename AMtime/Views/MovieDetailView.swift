//
//  MovieDetailView.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: MovieViewModel

    @State private var showSeats: Bool = false

    var body: some View {
        return VStack(alignment: .leading) {
            createTitle()
            LineRatingView(value: movie.voteAverage)
            createGenreList()
            HStack {
                Text(self.movie.releaseDate).foregroundColor(Color.gray)
                Spacer()
                Text(self.movie.runtime).foregroundColor(Color.gray)
            }.padding(.vertical)
            createDescription()
            createChooseSeatButton()
        }.padding(.horizontal).padding(.bottom, 20)
    }

    fileprivate func createTitle() -> some View {
        return Text(movie.title)
            .font(.system(size: 35, weight: .black, design: .rounded))
            .layoutPriority(1)
            .multilineTextAlignment(.leading)
            .lineLimit(nil)
    }

    fileprivate func createGenreList() -> some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(self.movie.genres, id: \.self) { genre in
                    Text(genre)
                        .bold()
                        .padding(5)
                        .background(Color.lightGray)
                        .cornerRadius(10)
                        .foregroundColor(Color.gray)
                }
            }
        }
    }

    fileprivate func createDescription() -> some View {
        return Text(movie.overview).lineLimit(nil).font(.body)
    }

    fileprivate func createChooseSeatButton() -> some View {
        return LCButton(text: "Choose seats") {
            self.showSeats.toggle()
        }.sheet(isPresented: $showSeats) {
            SeatsChoiceView(movie: self.movie)
        }.padding(.vertical)
    }
}
