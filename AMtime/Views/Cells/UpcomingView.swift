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

            VStack(alignment: .leading) {
                Text("Spies in disguise").font(.title).bold()
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
