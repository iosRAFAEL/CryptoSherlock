//
//  StatisticModel.swift
//  CryptoSherlock
//
//  Created by RAFAEL on 16.08.2023.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percetageChange: Double?
    
    init(title: String, value: String, percetageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percetageChange = percetageChange
    }
    
}
