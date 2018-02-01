//
//  DateHelper.swift
//  YellowPod
//
//  Created by Luis Burgos on 1/8/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

enum OwnDateFormat: String {
    //HERE: Add your own date formats
    case local = "yyyy-MM-dd HH:mm:ssZ"
    case server = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    case serviceView = "dd MMM yyyy"
    case showView = "EEE, dd MMM"
    case hour = "H:mm"
}

class DateHelper {
    //TODO: Evaluate use of locale string
    static let localePreferred = "es"
    static let timeZoneServer = "GMT"
    static let minutesOnADay = 1440
    
    static func string(from date: Date, using format: OwnDateFormat = .server) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = Locale.init(identifier: localePreferred)
        return dateFormatter.string(from: date)
    }
    
    static func formatStringFromLocal(from string: String, using format: OwnDateFormat = .server) -> String {
        let originalDate = date(from: string, using: .local)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = Locale.init(identifier: localePreferred)
        return dateFormatter.string(from: originalDate!)
    }
    
    static func date(from string: String, using format: OwnDateFormat = .server) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = Locale.init(identifier: localePreferred)
        return dateFormatter.date(from: string)
    }
    
    static func add(minutes: Int, to date: Date) -> Date? {
        let calendar = Calendar.current
        let dateWithAdition = calendar.date(byAdding: .minute, value: minutes, to: date)
        return dateWithAdition
    }
    
    static func betweenTimes(startTime: String, endTime: String) -> String {
        let fromHour = formatStringFromLocal(from: startTime, using: .hour)
        let toHour = formatStringFromLocal(from: endTime, using: .hour)
        return "Entre " + fromHour + " y " + toHour
    }
    
    static func convertFromLocalToServer(from string: String?) -> String {
        guard let string = string ,let originalDate = date(from: string, using: .local) else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = OwnDateFormat.server.rawValue
        dateFormatter.locale = Locale.init(identifier: localePreferred)
        return dateFormatter.string(from: originalDate)
    }
    
    static func convertServerToLocal(from string: String?) -> String {
        guard let string = string else { return "" }
        let originalDate = date(from: string, using: .server)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = OwnDateFormat.local.rawValue
        dateFormatter.locale = Locale.init(identifier: localePreferred)
        return dateFormatter.string(from: originalDate!)
    }
    
    static func setHourToDate(selectedDate: Date, hour: Float) -> String {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: selectedDate)
        
        components.hour = Int(roundf(hour))
        components.minute = 0
        components.second = 0
        
        let date = calendar.date(from: components)!
        return DateHelper.string(from: date, using: .local)
    }
    
    static func getHour(from string: String) -> Float? {
        guard let date = self.date(from: string, using: .local) else { return nil }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour], from: date)
        guard let hour = components.hour else { return nil }
        return Float(hour)
    }
    
    static func setTomorrowHour(from string: String) -> String {
        let date = self.date(from: string, using: .local)
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date!)
        
        let tomorrowDate = self.add(minutes: minutesOnADay, to: Date())!
        var tomorrowComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: tomorrowDate)
        
        tomorrowComponents.hour = dateComponents.hour
        tomorrowComponents.minute = 0
        tomorrowComponents.second = 0
        
        let resultDate = calendar.date(from: tomorrowComponents)!
        return self.string(from: resultDate, using: .local)
    }
    
    static func isBeforeToday(string: String) -> Bool {
        guard let date = self.date(from: string, using: .local) else { return true }
        let currrentDate = Date()
        return date < currrentDate
    }
    
    static func tomorrow() -> Date {
        let currrentDate = Date()
        let calendar = Calendar.current
        
        let tomorrow = self.add(minutes: minutesOnADay, to: currrentDate)
        var tomorrowComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: tomorrow!)
        tomorrowComponents.minute = 0
        tomorrowComponents.second = 0
        
        return calendar.date(from: tomorrowComponents)!
    }
}
