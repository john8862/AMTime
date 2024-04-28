//
//  MovieListRow.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import Kingfisher
import SwiftUI

struct MovieListRow: View {
    var movie: MovieViewModel

    fileprivate func createImage() -> some View {
        return KFImage(source: .network(movie.posterUrl))
            .resizable()
            .aspectRatio(contentMode: .fit).cornerRadius(20)
    }

    fileprivate func createTitle() -> some View {
        return Text(movie.title)
            .font(.system(size: 25, weight: .black, design: .rounded))
            .foregroundColor(Color.white)
    }

    var body: some View {
        return ZStack(alignment: .bottom) {
            createImage()

            VStack(alignment: .leading) {
                createTitle()
                LineRatingView(value: movie.voteAverage)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .bottom, endPoint: .top)).cornerRadius(20)
                .shadow(radius: 10)

        }.padding(.vertical)
    }
}
