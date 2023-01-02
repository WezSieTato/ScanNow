import Foundation

extension Date {
    static func date(year: Int = 1991, month: Int = 8, day: Int = 16, hour: Int = 0, minute: Int = 0) -> Date {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!

        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute

        let date = gregorianCalendar.date(from: dateComponents)!
        return date
    }
}
