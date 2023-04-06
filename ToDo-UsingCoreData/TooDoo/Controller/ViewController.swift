//
//  ViewController.swift
//  TooDoo
//
//  Created by Md. Faysal Ahmed on 18/12/22.
//

import UIKit

struct newNote {
    var title: String?
    var detail: String?
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ArrayViewModel()                //CoreData Model
    var isEdit: Bool = false                        //For Update
    var editIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchData()                       //Initial Fetch CoreData
        setupTableView()
    }
    
    
    func setupTableView() {
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    
    @IBAction func addButtonAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "AddContact", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddContact") as! AddContactVC
        
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    

}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.title.text = viewModel.arr[indexPath.row].title
        cell.detail.text = viewModel.arr[indexPath.row].detail
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isEdit = true
        editIndex = indexPath.row
        
        let storyboard = UIStoryboard(name: "AddContact", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddContact") as! AddContactVC
        vc.delegate = self
        
        vc.titleTemp = viewModel.arr[indexPath.row].title
        vc.detailTemp = viewModel.arr[indexPath.row].detail
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)

    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            viewModel.deleteData(index: indexPath.row)
            updateTableView()
        }

    }
    
}



extension ViewController: addNewNoteDelgate {
    
    fileprivate func updateTableView() {
        viewModel.fetchData()                   //CoreData model fetching
        tableView.reloadData()
    }
    
    func newNote(note: newNote) {
        
        if !isEdit {
            viewModel.saveData(title: note.title, detail: note.detail) //save to CoreData
            updateTableView()
            
        }else {
            //When Update
            viewModel.arr[editIndex!].title =  note.title
            viewModel.arr[editIndex!].detail = note.detail
            viewModel.saveUpdate()
            
            updateTableView()
            isEdit = false
        }
    }
    
}
