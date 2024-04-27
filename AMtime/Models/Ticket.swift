//
//  Ticket.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import Foundation

struct Ticket<T: Movie>: Identifiable {
    var id: UUID
    var movie: T
    var date: TicketDate
    var hour: String

    static var `default`: Ticket<Popular> {
        .init(id: UUID(), movie: Popular.default, date: TicketDate.default, hour: "")
    }
}
