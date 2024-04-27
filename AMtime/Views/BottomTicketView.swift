//
//  BottomTicketView.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import SwiftUI

struct BottomTicketView: View {
    var body: some View {
        Image("Barcode")
            .resizable()
            .scaledToFit()
            .padding(30)
            .frame(minWidth: 0.0, maxWidth: .infinity)
            .foregroundColor(Color.gray)
    }
}

struct BottomTicketView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTicketView()
    }
}
