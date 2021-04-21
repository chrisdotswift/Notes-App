//
//  AddNoteViewController.swift
//  Notes-App
//
//  Created by macOS on 09/04/2021.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    // MARK: - Initialization
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    var note: Note?
    var update = false
    
    // MARK: - LifeCycle Hooks
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Prepopulate the Text Field if the user is updating a note
        if update == true {
            titleTextField.text = note!.title
            bodyTextView.text = note!.note
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Disable the delete button if the user is adding a new note
        if update == false {
            self.deleteButton.isEnabled = true
            self.deleteButton.title = ""
        }
    }
    
    // MARK: - UI Buttons
    
    @IBAction func saveTap(_ sender: Any) {
        // Create a date string that we can pass in to the database
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.string(from: Date())
        
        // If the user is updating update the note rather than save one
        if update == true {
            APIFunctions.functions.updateNote(title: titleTextField.text!, note: bodyTextView.text, date: date, id: note!._id)
            self.navigationController?.popViewController(animated: true)
        } else if titleTextField.text != "" && bodyTextView.text != "" {
            APIFunctions.functions.addNote(title: titleTextField.text!, note: bodyTextView.text, date: date)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteTap(_ sender: Any) {
        APIFunctions.functions.deleteNote(id: note!._id)
        // Return the screen back to the main screen
        self.navigationController?.popViewController(animated: true)
    }
}
