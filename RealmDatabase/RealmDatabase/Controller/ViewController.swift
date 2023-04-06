//
//  ViewController.swift
//  RealmDatabase
//
//  Created by Md. Faysal Ahmed on 7/1/23.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var realm = try! Realm()
    
    var tasks = [ToDoTask]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchingData()
    }
    
    
    func fetchingData() {
        //Get all the data from the database
        let notes = realm.objects(ToDoTask.self)
        
        //Clear the model data array to prevent duplicates
        self.tasks.removeAll()
        
        if(!notes.isEmpty) {
            for n in notes {
                self.tasks.append(n)
            }
            self.tableView.reloadData()
        }
        
        
    }
    
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        
        let ac = UIAlertController(title: "Add Note", message: nil, preferredStyle: .alert)
        
        ac.addTextField(configurationHandler: .none)
        
        ac.addAction(UIAlertAction(title: "Add", style: .default, handler: { (UIAlertAction) in
            
            if let text = ac.textFields?.first?.text {
                let t = ToDoTask()
                t.taskid = UUID().uuidString
                t.tasknote = text
                self.tasks.append(t)
                
                //Add data to database
                self.realm.beginWrite()
                self.realm.add(t)
                try! self.realm.commitWrite()
                

                self.tableView.reloadData()
            }
            
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(ac, animated: true, completion: nil)
    }
        
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].tasknote
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        let tasktomodify = tasks[indexPath.row]
        let ac = UIAlertController(title: "Update task", message: nil, preferredStyle: .alert)
        
        ac.addTextField(configurationHandler: .none)
        ac.textFields?.first?.text = tasktomodify.tasknote
        
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
            if let text = ac.textFields?.first?.text {
                self.realm.beginWrite()
                tasktomodify.tasknote = text
                try! self.realm.commitWrite()
                
                self.tableView.reloadData()

            }
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let tasktoDelete = tasks[indexPath.row]
            
            realm.beginWrite()
            realm.delete(tasktoDelete)
            try! realm.commitWrite()
            
            self.tasks.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    
}
