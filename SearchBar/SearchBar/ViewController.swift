//
//  ViewController.swift
//  SearchBar
//
//  Created by Md. Faysal Ahmed on 26/3/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var dataResource: [String : Restaurant] = [
        "Biye Bari": Restaurant(name: "Biye Bari", location: "Dhanmondi", star: 3.4, image: "https://www.posist.com/restaurant-times/wp-content/uploads/2016/12/Online-Food-Orders.jpg"),
        "Kacchi Vai": Restaurant(name: "Kacchi Vai", location: "Mirpur 10", star: 4.4, image: "https://www.posist.com/restaurant-times/wp-content/uploads/2016/12/third-part-platforms-for-online-orders.jpg"),
        "Sultan's Dine": Restaurant(name: "Sultan's Dine", location: "ECB Square", star: 4.9, image: "https://www.posist.com/restaurant-times/wp-content/uploads/2016/12/lucian-alexe-afDu-GuxjjM-unsplash-scaled.jpg"),
        "Biye Bari 2": Restaurant(name: "Biye Bari", location: "Mirpur 12", star: 3.9, image: "https://www.posist.com/restaurant-times/wp-content/uploads/2016/12/Online-Food-Orders.jpg"),
        "Faysal Vai": Restaurant(name: "Faysal Vai", location: "Muhammadpur", star: 4.4, image: "https://www.posist.com/restaurant-times/wp-content/uploads/2016/12/third-part-platforms-for-online-orders.jpg"),
        "CV": Restaurant(name: "CV", location: "Comilla", star: 4.9, image: "https://www.posist.com/restaurant-times/wp-content/uploads/2016/12/lucian-alexe-afDu-GuxjjM-unsplash-scaled.jpg"),
    ]
    
    var searchData = [String]()
    
    var restaurants = ["Biye Bari", "Kacchi Vai", "Sultan's Dine", "Biye Bari 2", "Faysal Vai", "CV"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        searchData = restaurants
        searchBar.delegate = self
    }
    
    func setupTableView() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = dataResource[searchData[indexPath.row]]!
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.configure(img: data.image, name: data.name, star: data.star, location: data.location)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 205
    }
    
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchData = restaurants.filter { $0.localizedCaseInsensitiveContains(searchText) }
        
        self.tableView.reloadData()
    }
}
