//
//  AddNoteViewController.swift
//  TOKEN
//
//  Created by Md. Faysal Ahmed on 30/11/22.
//

import UIKit

protocol NewNoteDelegate {
    func newNote(note: NewNotes)
}

class AddNoteViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var detailsField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var delegate: NewNoteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        
        delegate?.newNote(note: NewNotes(
            title: titleField.text!,
            details: detailsField.text!
        ))
        print("presseeed", titleField.text!, "details: ", detailsField.text!)
        
        self.dismiss(animated: true)
    }
    
}
