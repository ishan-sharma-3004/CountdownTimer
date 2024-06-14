import SwiftUI

struct ReminderView: View {
    var reminder: Reminder

    var body: some View {
            VStack(alignment: .leading) {
                Text(reminder.event)
                    .font(.headline)
                    .foregroundColor(.black)
                Text("Alert in: \(reminder.countdownString)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    
            }.cornerRadius(10)
            .padding()
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView(reminder: Reminder(event: "Test Reminder", date: Date().addingTimeInterval(3600), color: .gray))
    }
}
