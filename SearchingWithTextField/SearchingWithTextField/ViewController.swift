//
//  ViewController.swift
//  SearchingWithTextField
//
//  Created by Md. Faysal Ahmed on 10/4/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let location = ["Mirpur", "ECB", "Muhammadpur", "Asad Gate", "Mirpur 12", "ECB Square", "Dhaka Cantonment", "Mirpur 2", "ECB 3", "Muhammadpur 2", "Asad Gate 4", "Mirpur 14", "ECB Square 2", "Dhaka Cantonment Area"]
    var filteredData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        searchField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }
    
    

    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let searchText = textField.text else { return }
        
        // Filter the data source based on the search text
        filteredData = location.filter { $0.lowercased().contains(searchText.lowercased()) }
        
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        
        return cell
    }
    
}
