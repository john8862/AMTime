//
//  ActorListView.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import SwiftUI

struct ActorListView: View {
    
    var actors: [Actor]
    var section: HomeSection
    var body: some View {
        NavigationView {
            List(0..<actors.count) { i in
                ActorListRow(actor: self.actors[i])
            }.navigationBarTitle(section.rawValue)
        }
    }
}

struct ActorListView_Previews: PreviewProvider {
    static var previews: some View {
        ActorListView(actors: [], section: .Trending)
    }
}
