//
//  ContentView.swift
//  SimplyToDoList
//
//  Created by Serhii Berehovyi on 06.12.22.
//

import SwiftUI

struct ToDoListView: View {
    var toDos = [ "learn Swift",
                  "Build Apps",
                  "Change the World",
                  "Bring the Awesome",
                  "Take a Vacation"
    ]
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(toDos, id: \.self){ toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }

                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}

