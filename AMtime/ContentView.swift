//
//  ContentView.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var model = MovieViewModel()

    var body: some View {
        VStack {
            let movieCollectionView = createCollectionView().edgesIgnoringSafeArea(.all).navigationBarTitle("Movies")

            return NavigationView {
                movieCollectionView
            }
        }
        .padding()
    }
    
    fileprivate func createCollectionView() -> MovieCollectionView {
            return MovieCollectionView(allItems: model.allItems, didSelectItem: { indexPath in }, seeAllforSection: { section in })
        }
}

#Preview {
    ContentView()
}
