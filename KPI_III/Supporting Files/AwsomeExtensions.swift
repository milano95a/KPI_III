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
}
