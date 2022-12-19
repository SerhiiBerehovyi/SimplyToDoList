//
//  DetailView.swift
//  SimplyToDoList
//
//  Created by Serhii Berehovyi on 06.12.22.
//

import SwiftUI


struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var toDosVM: ToDoViewModel
    
    @State var toDo: ToDo
    
    
    var body: some View {
        List{
            TextField("Enter ToDo Here", text: $toDo.item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
                
            
            Toggle("Set Reminder:", isOn: $toDo.reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            
            DatePicker("Date", selection: $toDo.dueDate)
                .padding(.bottom)
                .disabled(!toDo.reminderIsOn)
                
            TextField("Notes", text: $toDo.notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Completed:", isOn: $toDo.isComplited)
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
                    toDosVM.saveToDo(toDo: toDo)
                    dismiss()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            DetailView(toDo: ToDo())
                .environmentObject(ToDoViewModel())
        }
    }
}
