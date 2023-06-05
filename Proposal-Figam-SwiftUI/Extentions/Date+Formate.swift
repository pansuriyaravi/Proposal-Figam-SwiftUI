////
//  Date+Formate.swift
//  bug-free-goggles
//
//  Created by Mac on 24/05/23.
//

import Foundation

extension Date{
    /// Enum representing different date formats.
    enum Format: String {
        /// ISO 8601 format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        case iso8601 = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        /// Standard format: "yyyy-MM-dd HH:mm:ss"
        case standard = "yyyy-MM-dd HH:mm:ss"
        /// Short date format.  ""dd/MM/yyyy"
        case ddMMyyyySlashed = "dd/MM/yyyy"
        /// Short date format.  ""dd MMM, yyyy"
        case ddMMMyyyy = "dd MMM, yyyy"
        /// Short date format.  ""dd MMM"
        case ddMMM = "dd MMM"
        /// Short date format: "MMM d, yyyy"
        case MMMddyyyy = "MMM dd, yyyy"
        /// Short date format: "MMM dd"
        case MMMdd = "MMM dd"
        /// Short date format: "yyyy"
        case yyyy = "yyyy"
        /// Short date format: "dd-mm-yyyy"
        case ddMMyyyydashed = "dd-MM-yyyy"
        /// Short date format: "HH:mm a"
        case hhmma = "hh:mm a"
    }
    
    /// Converts the date to a string using the specified format.
    ///
    /// - Parameter format: The format to use for the string conversion.
    /// - Returns: The string representation of the date.
    func toString(format: Format = .iso8601) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
    
    /// Parses the given string into a `Date` object using the specified format.
    ///
    /// - Parameters:
    ///   - dateString: The string representation of the date.
    ///   - format: The format to use for parsing the date string.
    /// - Returns: A `Date` object parsed from the string, or `nil` if parsing fails.
    static func fromString(_ dateString: String, format: Format = .iso8601) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.date(from: dateString)
    }
    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date {
        startOfDay.adjust(.day, offset: 1).adjust(.second, offset: -1)
    }
    
    public enum DateComponentType {
        case second, minute, hour, day, weekday, nthWeekday, week, month, year
    }
    
    func adjust(_ component: DateComponentType, offset: Int) -> Date {
        var dateComp = DateComponents()
        switch component {
            case .second:
                dateComp.second = offset
            case .minute:
                dateComp.minute = offset
            case .hour:
                dateComp.hour = offset
            case .day:
                dateComp.day = offset
            case .weekday:
                dateComp.weekday = offset
            case .nthWeekday:
                dateComp.weekdayOrdinal = offset
            case .week:
                dateComp.weekOfYear = offset
            case .month:
                dateComp.month = offset
            case .year:
                dateComp.year = offset
        }
        return Calendar.current.date(byAdding: dateComp, to: self)!
    }
}

extension Date{
    static func generateDateArray(from startDate: Date, to endDate: Date) -> [Date] {
        let startDate = startDate.startOfDay
        let endDate = endDate.endOfDay
        
        var dates: [Date] = []
        
        // Create a calendar instance
        let calendar = Calendar.current
        
        // Define the range of dates using DateComponents
        let dateComponents = DateComponents(day: 1)
        
        // Start from the startDate and iterate until the endDate
        var currentDate = startDate
        while currentDate <= endDate {
            dates.append(currentDate)
            
            // Advance to the next date
            currentDate = calendar.date(byAdding: dateComponents, to: currentDate)!
        }
        return dates
    }
    
    static func string(start: Date, end: Date, formate: Date.Format) -> String{
        let start = start.toString(format: formate)
        let end = end.toString(format: formate)
        return "\(start) - \(end)"
    }
}
