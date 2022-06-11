//
//  Date+Helpers.swift
//  SwiftMVVMStartupProject
//
//  Created by Mahmoud Ibaraheim on 6/15/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation

extension Date {
    init(serverDateUTC: String) {
        self = Formatter.iso8601.date(from: serverDateUTC) ?? Date()
    }
    
    init(appDateFormate: String) {
        self = Formatter.appDateFormate.date(from: appDateFormate) ?? Date()
    }
    
    init(birthDate: String) {
        self = Formatter.birthDateFormate.date(from: birthDate) ?? Date()
    }
    
    var uiFormatted: String {
        return Formatter.uiFormatter.string(from: self)
    }
    
    var appDateFormate: String {
        return Formatter.appDateFormate.string(from: self)
    }
    
    var birthDateFormate: String {
        return Formatter.birthDateFormate.string(from: self)
    }
    
    func getCurrentSecond() ->Int {
        let date = Date()
        let calendar = Calendar.current
        let seconds = calendar.component(.second, from: date)
        return seconds
    }
}

extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return formatter
    }()
    
    static let uiFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        formatter.dateFormat = "MMM d, yyyy hh:mm a"
        return formatter
    }()
    
    static let appDateFormate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    static let birthDateFormate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy - MM - dd"
        return formatter
    }()
}
