//
//  ToDo.swift
//  SimplyToDoList
//
//  Created by Serhii Berehovyi on 18.12.22.
//

import Foundation

struct ToDo: Identifiable, Codable {
    var id: String?
    
    var item = ""
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)
    var notes = ""
    var isComplited = false
}
