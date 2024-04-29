//
//  ContentView.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var section: HomeSection?
    @State private var selectedMovie: MovieViewModel?
        
    @ObservedObject var model = MovieListingViewModel()
        
    var body: some View {
        return NavigationView {
            if model.sectionMovies.isEmpty {
                LoadingView().frame(width: 50, height: 50)
            } else {
                createSections()
                    .sheet(isPresented: .constant(self.section != nil || selectedMovie != nil), onDismiss: {
                        selectedMovie = nil
                        section = nil
                    }) {
                        selectedMovie.map { SingleMovieView(movieId: $0.id) }
                        section.map { MovieListView(section: $0) }
                    }
            }

        }.onAppear {
            self.model.getSectionMovies()
        }
    }
        
    fileprivate func createSections() -> some View {
        ScrollView {
            VStack(spacing: 20) {
                SectionView(sectionType: .NowPlaying, allItems: model.sectionMovies, seeSection: $section, selectedMovie: $selectedMovie)
                SectionView(sectionType: .Popular, allItems: model.sectionMovies, seeSection: $section, selectedMovie: $selectedMovie)
                SectionView(sectionType: .Upcoming, allItems: model.sectionMovies, seeSection: $section, selectedMovie: $selectedMovie)
                SectionView(sectionType: .TopRated, allItems: model.sectionMovies, seeSection: $section, selectedMovie: $selectedMovie)
            }.padding(.top, 20)
        }.navigationTitle(Text("Movies"))
    }
}

#Preview {
    ContentView()
}
