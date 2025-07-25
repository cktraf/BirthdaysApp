//
//  ContentView.swift
//  BirthdaysApp
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var friends : [Friend]
       // Friend(name: "Juliet", birthday: Date(timeIntervalSince1970: 36)), Friend(name: "Emerson", birthday: Date(timeIntervalSince1970: 37))]
        
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }//hStack end
            }//list
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom){
                VStack(alignment: .center, spacing: 20) {
                    Text("New birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }//date picker
                    
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        context.insert(newFriend)
                        newName = ""
                        newBirthday = .now
                    }//button
                    .bold()
                }//vStack
                .padding()
                .background(.bar)
            }//safe area inset end
        }//nav stack
    }//body
}//struct

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
