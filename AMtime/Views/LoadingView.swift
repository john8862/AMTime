//
//  LoadingView.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import SwiftUI

struct LoadingView: View {
    var lineWidth: CGFloat = 3
    @State private var flag = false

    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 1)
                .stroke(style: StrokeStyle(lineWidth: self.lineWidth, lineCap: .round, lineJoin: .round, dash: [10, 10], dashPhase: flag ? 0 : 40))
                .fill(LinearGradient(gradient: Gradient(colors: [Color.accent, .darkPurple]), startPoint: .leading, endPoint: .trailing))
                .rotationEffect(.degrees(flag ? 360 : 0)) // Use rotationEffect for animation
                .animation(Animation.linear(duration: 0.5).repeatForever(autoreverses: false), value: flag) // Apply animation with value dependency
                .onAppear {
                    self.flag = true
                }.onDisappear {
                    self.flag = false
                }
        }
    }

    func stop() {
        flag = false
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
