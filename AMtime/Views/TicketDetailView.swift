//
//  TicketDetailView.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import SwiftUI

struct TicketDetailView: View {
    var detail1 = "SEAT"
    var detail2 = "34"
    var detail3 = "TIME"
    var detail4 = "18:15"

    var body: some View {
        VStack(spacing: 10) {
            VStack {
                Text(detail1)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(Color.gray)
                Text(detail2)
                    .font(.system(size: 30, weight: .black))
            }

            VStack {
                Text(detail3)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(Color.gray)
                Text(detail4).font(.system(size: 15, weight: .bold))
            }
        }.frame(minWidth: 0.0, maxWidth: .infinity)
    }
}

struct TicketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TicketDetailView()
    }
}
