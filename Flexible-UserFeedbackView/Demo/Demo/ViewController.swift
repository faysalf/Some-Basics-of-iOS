//
//  ViewController.swift
//  Demo
//
//  Created by Md. Faysal Ahmed on 16/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    var userFeedbackMainView: UIView?
    var mainScrollView: UIScrollView?
    
    lazy var lbl: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl.text = "User Feedback"
        lbl.frame = CGRect(x: 0, y: 60, width: view.frame.width-50, height: 30)
        view.addSubview(lbl)
        setMainScrollView()
        setMainView()
        createCard()
    }
    
    func setMainView() {
        userFeedbackMainView = UIView()
        userFeedbackMainView?.backgroundColor = .clear
        userFeedbackMainView?.frame = CGRect(x: 0, y: 5, width: view.frame.width-32, height: view.frame.height-60)
        mainScrollView?.addSubview(userFeedbackMainView!)

    }
    
    func setMainScrollView() {
        mainScrollView = UIScrollView()
        mainScrollView?.frame = CGRect(x: 16, y: lbl.frame.maxY+10, width: view.frame.width-32, height: view.frame.height-60)
        mainScrollView?.contentSize = CGSize(width: view.frame.width-32, height: 1000)//Guess
        mainScrollView?.showsVerticalScrollIndicator = false
        view.addSubview(mainScrollView!)
    }
    
    func createCard() {
        var cmnt = "\"This cozy restaurant has left the best impressions! Hospitable hosts, delicious dishes, beautiful presentation, wide wine list and wonderful dessert."
        var top = 0.0
        for i in 0..<9 {
            let viw = getViewAndLabel(name: "Mr. Faysal", starImg: UIImage(named: "stars")!, starText: "(5 Out of 5)", dineDate: "Dined on July 5,2021", comment: cmnt+"\"", top: top)
            userFeedbackMainView!.addSubview(viw)
            top += viw.frame.height + 10.0
            cmnt += " \(i+1)th number is added successfully."
        }
        
        userFeedbackMainView?.frame = CGRect(x: 0, y: 5, width: view.frame.width-32.0, height: top+5)
        mainScrollView?.contentSize = CGSize(width: view.frame.width-32.0, height: top+lbl.frame.height+15)
    }
    
    
    func getViewAndLabel(name: String, starImg: UIImage, starText: String, dineDate: String, comment: String, top: Double) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        let nameLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 20))
        nameLabel.font = UIFont(name: "System-Bold", size: 14)
        nameLabel.text = name
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        containerView.addSubview(nameLabel)
        
        let dineLabel = UILabel(frame: CGRect(x: view.frame.width-185, y: 10, width: 140, height: 30))
        dineLabel.textAlignment = .right
        dineLabel.font = UIFont.systemFont(ofSize: 12)
        dineLabel.text = dineDate
        containerView.addSubview(dineLabel)
        
        let starImgView = UIImageView(frame: CGRect(x: 10, y: nameLabel.frame.maxY+2, width: 55, height: 15))
        starImgView.image = starImg
        starImgView.contentMode = .scaleAspectFit
        containerView.addSubview(starImgView)
        
        let starLabel = UILabel(frame: CGRect(x: starImgView.frame.maxX+5, y: nameLabel.frame.maxY+2, width: 150, height: 15))
        starLabel.font = UIFont.systemFont(ofSize: 12)
        starLabel.text = starText
        starLabel.textAlignment = .left
        containerView.addSubview(starLabel)
        
        let commentLabel = UILabel()
        commentLabel.numberOfLines = 0
        commentLabel.text = comment
        commentLabel.font = UIFont.systemFont(ofSize: 12)
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.textAlignment = .justified
        containerView.addSubview(commentLabel)
        containerView.backgroundColor = .white
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.cornerRadius = 5

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: userFeedbackMainView!.topAnchor, constant: top),
            containerView.leadingAnchor.constraint(equalTo: userFeedbackMainView!.leadingAnchor, constant: 2),
            containerView.trailingAnchor.constraint(equalTo: userFeedbackMainView!.trailingAnchor, constant: -2),
            
            commentLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50),
            commentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            commentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            commentLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
        
        view.layoutIfNeeded()
        
        return containerView
    }
    
}
