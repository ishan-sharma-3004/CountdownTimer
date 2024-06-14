import SwiftUI

struct ReminderInputView: View {
    @Binding var reminders: [Reminder]
    @Binding var isPresented: Bool

    @State private var reminderName: String = ""
    @State private var selectedDate = Date()
    @State private var selectedColor = Color.white


    var body: some View {
        VStack {
            Text("Create Reminder")
                .font(.title)
                .padding()

            TextField("Reminder Name", text: $reminderName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .padding()

            ColorPicker("Select Color", selection: $selectedColor)
                .padding()

            Button(action: {
                let newReminder = Reminder(event: reminderName, date: selectedDate, color: selectedColor)
                reminders.append(newReminder)
                isPresented = false
            }) {
                Text("Confirm")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(22)
            }
            .padding()

            Spacer()
        }
        .padding()
        .navigationBarItems(trailing: Button("Cancel"){
            isPresented = false
        })
    }
}
struct ReminderInputView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderInputView(reminders: .constant([]), isPresented: .constant(true))
    }
}
