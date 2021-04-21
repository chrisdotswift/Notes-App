//
//  NotesCellStack.swift
//  Notes-App
//
//  Created by macOS on 16/04/2021.
//

import UIKit

class NotesCellStack: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var note: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
