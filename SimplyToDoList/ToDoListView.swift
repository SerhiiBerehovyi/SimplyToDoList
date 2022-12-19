//
//  ContentView.swift
//  SimplyToDoList
//
//  Created by Serhii Berehovyi on 06.12.22.
//

import SwiftUI

struct ToDoListView: View {
    @State private var sheetIsPresenred = false
    @EnvironmentObject var toDosVM: ToDoViewModel
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(toDosVM.toDos){ toDo in
                    HStack {
                        Image(systemName: toDo.isComplited ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture{
                                toDosVM.toggleComplited(toDo: toDo)
                            }

                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Text(toDo.item)
                        }
                    }
                }
                .onDelete(perform: toDosVM.delete)
                .onMove(perform: toDosVM.move)
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .font(.title2)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresenred.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $sheetIsPresenred) {
                NavigationStack{
                    DetailView(toDo: ToDo())
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
            .environmentObject(ToDoViewModel())
    }
}

