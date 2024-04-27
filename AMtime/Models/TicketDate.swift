//
//  TicketDate.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import Foundation

struct TicketDate: Equatable {
    var day: String
    var month: String
    var year: String
    
    static var `default`: TicketDate { TicketDate(day: "", month: "", year: "") }
}
