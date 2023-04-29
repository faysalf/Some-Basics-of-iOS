//
//  CustomTableView.swift
//  Demo
//
//  Created by Reserveit Support on 18/4/23.
//

import UIKit

protocol didTapOnCell {
    func delegateTV(indexPath: IndexPath)
}

final public class CustomTableView: UIView, UITableViewDelegate, UITableViewDataSource {

    public var restaurantArr: [String] = [] {
        didSet {
            updateUI()
        }
    }
    
    var delegate: didTapOnCell?
    
    private lazy var tableView: UITableView = {
        var tv = UITableView()
        tv.backgroundColor = .clear
        
        tv.delegate = self
        tv.dataSource = self
        tv.isPagingEnabled = false
        tv.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.id)
        tv.clipsToBounds = true
        tv.backgroundColor = .clear
        tv.showsHorizontalScrollIndicator = false
        tv.bounces = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        return tv
    }()
    
    // MARK: - Default Methods
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupTV()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTV()
    }
    
    public func setupTV() {
        // Below two is must needed to give anchorpoint for autoLayout
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // Can give this two of types, another is in viewController
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantArr.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.id, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = restaurantArr[indexPath.row]
        cell.backgroundColor = .systemBlue
        cell.dropShadow()
        cell.setNeedsLayout()
        return cell
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.delegateTV(indexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    
}
