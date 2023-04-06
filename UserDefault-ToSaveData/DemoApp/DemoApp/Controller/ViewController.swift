//
//  ViewController.swift
//  DemoApp
//
//  Created by Md. Faysal Ahmed on 12/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var nameArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSetUp()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameArray = UserDefaults.standard.stringArray(forKey: "saved") ?? [String]()
        
    }
    
    
    func tableViewSetUp() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    @IBAction func saveAction(_ sender: UIButton) {
        
        if nameField.text != "" {
            
            self.nameArray.append(nameField.text!)
            UserDefaults.standard.set(nameArray, forKey: "saved")
            
            tableView.reloadData()
        }
        
    }
    


}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return nameArray.count
    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.name.text = self.nameArray[indexPath.row]
        return cell
        
    }
    
    
    // MARK: - Delete row
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.nameArray.remove(at: indexPath.row)
            UserDefaults.standard.set(nameArray, forKey: "saved")
            print("Deleted!")
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
    }
        
        
    
}


