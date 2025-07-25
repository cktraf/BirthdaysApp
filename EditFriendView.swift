//
//  EditFriendView.swift
//  BirthdaysApp
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI

struct EditFriendView: View {
    var friend: Friend // new
        @State private var newName: String // new
        @State private var newBirthday: Date // new
        @Environment(\.dismiss) private var dismiss
    
    init(friend: Friend) { // new
        self.friend = friend // new
        _newName = State(initialValue: friend.name) // new
        _newBirthday = State(initialValue: friend.birthday) // new
    }//initialize
    var body: some View {
        Form { // new
                TextField("Name", text: $newName) // new
                DatePicker("Birthday", selection: $newBirthday, displayedComponents: .date) // new
        }//form
        .navigationTitle("Edit Friend") // new
        .navigationBarTitleDisplayMode(.inline) // new
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }//button
            }//toolbar item
            ToolbarItem(placement: .confirmationAction) { // new
                    Button("Save") { // new
                            friend.name = newName // new
                                friend.birthday = newBirthday // new
                        dismiss() // new
                    } // new
            } // toolbar item
        }//toolbar
    }//body
}//struct

#Preview {
    NavigationStack {
        EditFriendView(friend: Friend(name: "Test", birthday: Date.now))
    }//nav stack
}
