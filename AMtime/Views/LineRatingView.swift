//
//  LineRatingView.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import SwiftUI

struct LineRatingView: View {
    var height: CGFloat = 10
    var value: Double = 0.0

    fileprivate func createPath(with size: CGSize) -> some View {
        return Rectangle()
            .frame(width: size.width, height: height, alignment: .leading)
            .cornerRadius(height / 2)
            .foregroundColor(Color.gray.opacity(0.5))
    }

    fileprivate func createProgress(with size: CGSize) -> some View {
        return Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.accent, .darkPurple]), startPoint: .leading, endPoint: .trailing))
            .frame(width: size.width * CGFloat(value) / 5, height: height, alignment: .leading)
            .cornerRadius(height / 2)
    }

    var body: some View {
        HStack {
            GeometryReader { gr in
                ZStack(alignment: .leading) {
                    self.createPath(with: gr.size)
                    self.createProgress(with: gr.size)
                        .animation(.easeIn(duration: 1), value: value) // Apply animation with value dependency
                }
            }.frame(height: 15)

            Text("\(String(format: "%.1f", self.value))/5")
                .bold()
                .foregroundColor(Color.darkPurple)
        }
    }
}

struct LineRatingView_Previews: PreviewProvider {
    static var previews: some View {
        LineRatingView()
    }
}
