//
//  Ticket.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import Foundation

struct Ticket: Identifiable {
    var id: UUID
    var movie: MovieViewModel
    var date: TicketDate
    var hour: String

    static var `default`: Ticket {
        .init(id: UUID(), movie: MovieViewModel.default, date: TicketDate.default, hour: "")
    }
}
