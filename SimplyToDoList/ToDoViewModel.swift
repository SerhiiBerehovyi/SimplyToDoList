//
//  ToDoViewModel.swift
//  SimplyToDoList
//
//  Created by Serhii Berehovyi on 18.12.22.
//

import Foundation

class ToDoViewModel:ObservableObject {
    @Published var toDos: [ToDo] = []
    
    init() {
        self.loadData()
    }
    
    
    func saveToDo(toDo: ToDo){
        if toDo.id == nil {
            var newToDo = toDo
            newToDo.id = UUID().uuidString
            
            self.toDos.append(newToDo)
        }
        
        if let index = self.toDos.firstIndex(where: {$0.id == toDo.id}) {
            self.toDos[index] = toDo
        }
        
        saveData()
    }
    
    
    func delete(_ index: IndexSet){
        self.toDos.remove(atOffsets: index)
        saveData()
    }
    
    
    func move(from: IndexSet, to: Int){
        self.toDos.move(fromOffsets: from, toOffset: to)
        saveData()
    }
    
    
    func toggleComplited(toDo: ToDo){
        guard toDo.id != nil else {return}
        
        var newToDo = toDo
        newToDo.isComplited.toggle()
        
        if let index = toDos.firstIndex(where: {$0.id == newToDo.id}) {
            toDos[index] = newToDo
        }
        
        saveData()
    }
    
    
    func saveData(){
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos)
        do{
            try data?.write(to: path)
        } catch {
            print("🤬 ERROR: could not save data \(error.localizedDescription)")
        }
    }
    
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else {return}
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch {
            print("🤬 ERROR: could not load data \(error.localizedDescription)")
        }
    }
}
