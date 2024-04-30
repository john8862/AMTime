//
//  UpcomingView.swift
//  AMtime
//
//  Created by YILIN ZHAO on 29/4/2024.
//

import Kingfisher
import SwiftUI

struct UpcomingView: View {
    var movie: MovieViewModel

    var body: some View {
        HStack {
            KFImage(source: .network(movie.backdropUrl)).resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10.0)
                .frame(width:220)

            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title)
                    .bold()
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                Text(movie.releaseDate)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView(movie: MovieViewModel.default)
    }
}
