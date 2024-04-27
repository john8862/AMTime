//
//  Seat.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import Foundation

struct Seat: Identifiable {
    var id: UUID
    var row: Int
    var number: Int
    
    static var `default`: Seat { Seat(id: UUID(), row: 0, number: 0) }
}
