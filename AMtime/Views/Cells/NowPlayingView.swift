//
//  NowPlayingView.swift
//  AMtime
//
//  Created by YILIN ZHAO on 29/4/2024.
//

import Kingfisher
import SwiftUI

struct NowPlayingView: View {
    var movie: MovieViewModel

    var body: some View {
        return
            KFImage(source: .network(movie.backdropUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(
                    Text(movie.title)
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.bottom, 10)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .bottom, endPoint: .top)
                        ), alignment: .bottom
                ).cornerRadius(20)
    }
}

struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView(movie: MovieViewModel.default)
    }
}
