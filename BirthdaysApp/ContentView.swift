//
//  ContentView.swift
//  BirthdaysApp
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends = [
        Friend(name: "Juliet", birthday: Date(timeIntervalSince1970: 36)), Friend(name: "Emerson", birthday: Date(timeIntervalSince1970: 37))]
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }//hStack end
            }//list
            .navigationTitle("Birthdays")
        }//nav stack
    }//body
}//struct

#Preview {
    ContentView()
}
