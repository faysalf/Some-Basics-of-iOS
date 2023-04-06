//
//  ViewController.swift
//  MVVM-Demo
//
//  Created by Md. Faysal Ahmed on 19/3/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let data = [Person(firstName: "Faysal", lastName: "Ahmed", age: 22, height: 5.6),
                Person(firstName: "Jobayer", lastName: "Ahmed", age: 13, height: 5.2),
                Person(firstName: "Hafsa", lastName: "Eva", age: 17, height: 5.3)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        let model = data[indexPath.row]
        cell.configure(with: CellViewModel(firstName: model.firstName, lastName: model.lastName))
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}

