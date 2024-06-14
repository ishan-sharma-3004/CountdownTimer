import SwiftUI

struct Reminder: Identifiable {
    var id = UUID()
    var event: String
    var date: Date
    var color: Color

    // Calculate remaining time until the reminder's date
    var countdownString: String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute], from: Date(), to: date)
        
        if let days = components.day, let hours = components.hour, let minutes = components.minute {
            return String(format: "%02dd %02dh %02dm", days, hours, minutes)
        } else {
            return "Expired"
        }
    }
}
