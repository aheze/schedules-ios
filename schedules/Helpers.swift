//
//  Helpers.swift
//  schedules
//
//  Created by H. Kamran on 1/20/20.
//  Copyright © 2020 H. Kamran. All rights reserved.
//

import Foundation

struct Schedule: Identifiable {
    let id = UUID()
    let name: String
    let color: String
    var start = false
}

var schedule1 = Schedule(name: "Acalanes High School", color: "1a468f"),
    schedule2 = Schedule(name: "Campolindo High School", color: "a80000", start: true),
    schedule3 = Schedule(name: "M.H. Stanley Middle School", color: "006334")

var schedules = [schedule1, schedule2, schedule3]
