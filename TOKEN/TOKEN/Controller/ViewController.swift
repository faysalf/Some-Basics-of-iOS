//
//  ViewController.swift
//  TOKEN
//
//  Created by Md. Faysal Ahmed on 30/11/22.
//

import UIKit

struct NewNotes {
    var title: String
    var details: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var plusButton: UIButton!
    
    var notes: [Todo]?                              // For CoreData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        notes = CoreDataManager.shared.getAll()     // For CoreData

        setUpTableViewCell()
        plusButton.layer.cornerRadius = 25
    }
    
    
    func setUpTableViewCell() {
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.separatorColor = .init(red: 10, green: 20, blue: 20, alpha: 5)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func plusButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AddNoteViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddNoteViewController") as! AddNoteViewController
        
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return notes?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.title.text = notes?[indexPath.row].title
        cell.details.text = notes?[indexPath.row].text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    
}


extension ViewController: NewNoteDelegate {
    func newNote(note: NewNotes) {
        
        let context = Todo(context: CoreDataManager.shared.context)
        
        context.id = UUID()
        context.title = note.title
        context.text = note.details
        
        CoreDataManager.shared.saveContext()
        
        notes?.append(context)
        tableView.reloadData()
    }
    
    
}
