//
//  DynamicContainer.swift
//  AMtime
//
//  Created by zerui song on 29/4/2024.
//

import SwiftUI

struct DynamicContainer<Model, Content>: View where Content: View, Model: Identifiable {
    enum ContainerType {
        case stack, grid
    }
    
    var type: ContainerType
    var data: [Model]
    var content: (Model) -> Content
    
    private let gridLayout = [
        GridItem(.flexible(minimum: 100), spacing: 10, alignment: .center),
        GridItem(.flexible(minimum: 100), spacing: 10, alignment: .center),
    ]

    init(data: [Model]?, type: ContainerType = .stack, @ViewBuilder content: @escaping (Model) -> Content) {
        self.data = data ?? []
        self.type = type
        self.content = content
    }

    var body: some View {
        switch type {
        case .stack:
            return AnyView(
                LazyHStack(spacing: 20) {
                    ForEach(data) { value in
                        self.content(value)
                    }
                }.padding(.horizontal, 20)
            )
        case .grid:
            return AnyView(LazyHGrid(rows: gridLayout, spacing: 0) {
                ForEach(data) { value in
                    self.content(value)
                }
            })
        }
    }
}

