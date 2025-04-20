//
//  ViewController.swift
//  API-Alamofire
//
//  Created by Md. Faysal Ahmed on 21/3/23.
//

import UIKit
import Alamofire

func handleError(_ error: Error)-> String {
    if let myError = error as? NetworkError {
        switch myError {
        case .error(let message):
            return message
        }
    } else {
        return "Something went wrong!"
    }
}

class ViewController: UIViewController {

    // MARK: - Private Methods
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorLabel: UILabel!
    
    var dataSource = [UserInfoModel]()
    let httpMethods = HTTPMethodsCustomization()
    
    let vm = HomeViewModel()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableViewCell()
    }
    
    // setup ui
    func setupTableViewCell() {
        let nib = UINib(nibName: "CustomTableTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Actions
    @IBAction func singleGetAction(_ sender: UIButton) {
        vm.getSingleUser { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let value):
                self.dataSource = [value.data]
                self.reloadTableView()
                
            case .failure(let error):
                errorLabel.text = handleError(error)
            }
        }
    }
    
    @IBAction func listGetAction(_ sender: UIButton) {
        vm.getUserList(pageNo: 2) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let value):
                self.dataSource = value.data
                self.reloadTableView()
                
            case .failure(let error):
                errorLabel.text = handleError(error)
            }
        }
    }
    
    @IBAction func patchAction(_ sender: UIButton) {
        vm.patchRequest { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let msg):
                errorLabel.text = msg

            case .failure(let error):
                errorLabel.text = handleError(error)
            }
        }
    }
    
    @IBAction func postAction(_ sender: UIButton) {
        let user = PostModel(
            roll: 54,
            name: "Md. Faysal Ahmed",
            email: "mdfaysal@gmail.com",
            password: "mdfaysal"
        )
        
        vm.createAnUser(params: user) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let message):
                errorLabel.text = message

            case .failure(let error):
                errorLabel.text = handleError(error)
            }
        }
    }
    
    @IBAction func putButtonAction(_ sender: UIButton) {
        let param: [String: Any] = [
            "Email": "faysal.ahmed@reserveitbd.com",
            "Name": "Faysal Ahmed",
            "Password": "faysalf123"
        ]
        
        vm.updateAnUserInfo(userId: 2) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let message):
                errorLabel.text = message

            case .failure(let error):
                errorLabel.text = handleError(error)
            }
        }
    }
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        vm.removeAnUser(userId: 2) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let message):
                errorLabel.text = message

            case .failure(let error):
                errorLabel.text = handleError(error)
            }
        }
    }
    
    @IBAction func singleUserNFAction(_ sender: UIButton) {

    }
    
    @IBAction func registerUnsuccessfulAction(_ sender: UIButton) {
        
    }
    
    @IBAction func delayedResponseAction(_ sender: UIButton) {

    }
    
    @IBAction func loginSuccessfulAction(_ sender: UIButton) {
        
    }
    
}

// MARK: TableViewDelegate & TableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as! CustomTableTableViewCell
        cell.configure(value: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
}

