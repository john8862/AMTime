//
//  PopularView.swift
//  AMtime
//
//  Created by YILIN ZHAO on 29/4/2024.
//

import Kingfisher
import SwiftUI

struct PopularView: View {
    var movie: MovieViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            KFImage(source: .network(movie.posterUrl)).resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(20)
                .clipped()
                .padding(.top, 5)
                .frame(height: 260)

            Text(movie.title)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 10)
                .frame(height: 50)
                .truncationMode(.tail)
        }
    }
}

struct PopularView_Previews: PreviewProvider {
    static var previews: some View {
        PopularView(movie: MovieViewModel.default)
    }
}
