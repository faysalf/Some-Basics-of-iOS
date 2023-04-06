//
//  AddContactVC.swift
//  TooDoo
//
//  Created by Md. Faysal Ahmed on 18/12/22.
//

import UIKit


protocol addNewNoteDelgate {
    func newNote(note: newNote)
}

class AddContactVC: UIViewController {
    
    
    @IBOutlet weak var titles: UITextField!
    @IBOutlet weak var details: UITextView!
    
    var titleTemp: String?
    var detailTemp: String?
    
    var delegate: addNewNoteDelgate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titles.text = titleTemp
        details.text = detailTemp ?? "Details?"
    }
    
    
    @IBAction func saveButtonAction(_ sender: Any) {
        
        delegate?.newNote(note: newNote(title: titles.text,
                                        detail: details.text))
        dismiss(animated: true)
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
