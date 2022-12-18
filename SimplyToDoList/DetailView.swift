//
//  DetailView.swift
//  SimplyToDoList
//
//  Created by Serhii Berehovyi on 06.12.22.
//

import SwiftUI

struct ToDo {
    var item: String
    var reminderIsOn: Bool
    var dueDate: Date
    var notes: String
    var isComplited: Bool
}

struct DetailView: View {
    var passedValue: String
    @Environment(\.dismiss) private var dismiss
    
    @State private var toDo = ""
    @State private var reminderIsOn = false
    @State private var dueDate = Date.now + (60*60*24)
    @State private var notes = ""
    @State private var isComplited = false
    
    
    var body: some View {
        List{
            TextField("Enter ToDo Here", text: $toDo)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
                
            
            Toggle("Set Reminder:", isOn: $reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            
            DatePicker("Date", selection: $dueDate)
                .padding(.bottom)
                .disabled(!reminderIsOn)
                
            TextField("Notes", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Completed:", isOn: $isComplited)
                .padding(.top)
                .listRowSeparator(.hidden)
        }
        .padding()
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cencel"){
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save"){
                    // TODO: add save code here
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        
        .onAppear(){
            toDo = passedValue
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            DetailView(passedValue: "Item 1")
        }
    }
}
