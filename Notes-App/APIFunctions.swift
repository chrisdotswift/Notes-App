//
//  APIFunctions.swift
//  Notes-App
//
//  Created by macOS on 16/04/2021.
//

import Foundation
import Alamofire

// MARK: - Custom Note Struct

struct Note: Decodable {
    var _id: String
    var title: String
    var note: String
    var date: String
}

// MARK: - Methods that interact with API

class APIFunctions {
    
    // Sets our custom Data Delegate
    var delegate: DataDelegate?
    // Create an instance of the class so the other files can interact with it
    static let functions = APIFunctions()
    
    // Fetch notes from MongoDB database
    func fetchNotes() {
        AF.request("http://192.168.1.73:8081/fetch").response { response in
            print(response.data!)
            // Converts the response into utf8 string format
            let data = String(data: response.data!, encoding: .utf8)
            // Fires off the custom delegate in the View Controller
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    // Adds a note to MongoDB database passing the arguments as headers
    func addNote(title: String, note: String, date: String) {
        AF.request("http://192.168.1.73:8081/create", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "note": note, "date": date]).responseJSON { response in
            
        }
    }
    
    // Updates a note to MongoDB database passing the arguments as headers
    func updateNote(title: String, note: String, date: String, id: String) {
        AF.request("http://192.168.1.73:8081/update", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "note": note, "date": date, "id": id]).responseJSON { response in
            
        }
    }
    
    // Delete a note from MongoDB database passing the note id argument as a header
    func deleteNote(id: String) {
        AF.request("http://192.168.1.73:8081/delete", method: .post, encoding: URLEncoding.httpBody, headers: ["id": id]).responseJSON { response in
            
        }
    }
}
