import SwiftUI

struct ContentView: View {
    @State private var reminders: [Reminder] = []
    @State private var isPresentingReminderInput = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Create Reminders Create Memories")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                
                Button(action: {
                    isPresentingReminderInput = true
                }) {
                    Text("+")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                        .background(.black)
                        .cornerRadius(22)
                }
                .buttonStyle(PlainButtonStyle())
                
                Divider()
                
                List {
                    ForEach(reminders) { reminder in
                        ReminderView(reminder: reminder).listRowBackground(reminder.color)
                            .swipeActions(edge: .leading, allowsFullSwipe: true){
                                Button(role: .destructive){
                                    if let index = reminders.firstIndex(where: { $0.id == reminder.id}){
                                        withAnimation{
                                        reminders.remove(at: index)
                                    }
                                }
                                } label:{
                                Label("Delete", systemImage: "Trash")
                            }
                    }
                }
            }
            .listStyle(PlainListStyle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.black)
            .navigationBarTitle("", displayMode: .inline)
            .sheet(isPresented: $isPresentingReminderInput) {
                ReminderInputView(reminders: $reminders, isPresented: $isPresentingReminderInput)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
