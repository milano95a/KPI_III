//
//  AwsomeExtensions.swift
//  KPI_III
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 30/04/23.
//

import Foundation

extension Date {
    func isSameMonth(_ date: Date) -> Bool {
        let month1 = Calendar.current.dateComponents([.month], from: self)
        let month2 = Calendar.current.dateComponents([.month], from: date)
        return month1 == month2
    }
    
    func isSameWeek(_ date: Date) -> Bool {
        let week1 = Calendar.current.dateComponents([.weekOfYear], from: self)
        let week2 = Calendar.current.dateComponents([.weekOfYear], from: date)
        return week1 == week2
    }
    
    func isSameDay(_ date: Date) -> Bool {
        self.year == date.year && self.dayInYear == date.dayInYear
    }
    
    var dayInYear: Int {
        Calendar.current.ordinality(of: .day, in: .year, for: self)!
    }
    
    var year: Int {
        Calendar.current.dateComponents([.year], from: self).year!
    }
    
    func numberOfMonthsSince() -> Int {
//        let calendar = Calendar.current
//        let toDate = Date() // This represents the current date
//        
//        let components = calendar.dateComponents([.month], from: calendar.startOfDay(for: toDate), to: calendar.startOfDay(for: toDate))
//        return components.month ?? 0
        
        let calendar = Calendar.current
        let fromDateStartOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: self))!
        let toDateStartOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: Date()))!

        let components = calendar.dateComponents([.month], from: fromDateStartOfMonth, to: toDateStartOfMonth)
        return components.month ?? 0
    }
    
    func numberOfWeeksSince() -> Int {
//        let calendar = Calendar.current
//        let toDate = Date() // This represents the current date
//        
//        let components = calendar.dateComponents([.weekOfYear], from: calendar.startOfDay(for: self), to: calendar.startOfDay(for: toDate))
//        return components.weekOfYear ?? 0
        
        let calendar = Calendar.current
        let fromDateStartOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
        let toDateStartOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!

        let components = calendar.dateComponents([.weekOfYear], from: fromDateStartOfWeek, to: toDateStartOfWeek)
        return components.weekOfYear ?? 0
    }
    
    func numberOfDaysSince() -> Int {
        let calendar = Calendar.current
        let toDate = Date() // This represents the current date
        
        let components = calendar.dateComponents([.day], from: calendar.startOfDay(for: self), to: calendar.startOfDay(for: toDate))
        return components.day ?? 0
    }
}
