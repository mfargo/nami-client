//
//  Date+NMExtensions.swift
//  Nami
//
//  Created by Matthew Fargo on 2018/05/09.
//  Copyright © 2018年 Matthew Fargo. All rights reserved.
//

import Foundation

extension Date {
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: midnight)!
    }
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var midnight: Date {
        let d = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
        return Date(timeInterval: Double(TimeZone.current.secondsFromGMT()), since: d)
    }
    var noon: Date {
        let d = Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
        return Date(timeInterval: Double(TimeZone.current.secondsFromGMT()), since: d)
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
}
