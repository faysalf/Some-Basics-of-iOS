//
//  IntroPageVC.swift
//  IntroPage-Programmatically
//
//  Created by Md. Faysal Ahmed on 7/4/23.
//

import UIKit

class IntroPageVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    var pageArr = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if UserDefaults.standard.bool(forKey: "isFirstView") {
            didTapButton()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let style = UINavigationBarAppearance()
        style.backgroundColor = .lightGray

        navigationController?.navigationBar.standardAppearance = style;
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configuration()
        
    }
    
    func configuration() {
        for i in 0..<pageController.numberOfPages {

            if i == 0 {
                let page1 = UIView(frame: CGRect(x: 0, y: 0, width: Int(view.frame.width), height: Int(view.frame.height)))
                pageArr.append(setPage1(page: page1))

            }else if i == 1 {
                let page2 = UIView(frame: CGRect(x: 0, y: 0, width: Int(view.frame.width), height: Int(view.frame.height)))
                pageArr.append(setPage2(page: page2))
                
            }else if i == 2 {
                let page3 = UIView(frame: CGRect(x: 0, y: 0, width: Int(view.frame.width), height: Int(view.frame.height)))
                pageArr.append(setPage3(page: page3))
            }
        }
        collectionView.reloadData()
    }
    
    
}

extension IntroPageVC {
    
    func setPage1(page: UIView) -> UIView {
        page.backgroundColor = .lightGray
        let widt = view.frame.width
        let imageView = UIImageView(frame: CGRect(x: 16, y: 70, width: Int(widt) - 32, height: Int(widt * 1.5)))
        imageView.image = UIImage(systemName: "photo.fill")
        imageView.contentMode = .scaleAspectFit
        page.addSubview(imageView)
        
        let lbl = MyLabel(frame: CGRect(x: 16, y: 80, width: Int(widt) - 32, height: 50))
        lbl.text = "1st Intro Page"
        lbl.textColor = .white
        lbl.backgroundColor = .systemGray
        lbl.layer.cornerRadius = 5
        page.addSubview(lbl)
        
        return page
    }
    
    func setPage2(page: UIView) -> UIView {
        page.backgroundColor = .systemBrown
        let widt = view.frame.width
        let imageView = UIImageView(frame: CGRect(x: 16, y: 70, width: Int(widt) - 32, height: Int(widt * 1.5)))
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFit
        page.addSubview(imageView)
        
        let lbl = MyLabel(frame: CGRect(x: 16, y: 80, width: Int(widt) - 32, height: 50))
        lbl.text = "2nd Intro Page"
        lbl.textColor = .white
        lbl.backgroundColor = .systemGray
        lbl.layer.cornerRadius = 5
        page.addSubview(lbl)
        
        return page
    }
    
    func setPage3(page: UIView) -> UIView {
        page.backgroundColor = .systemGreen
        let widt = view.frame.width
        let imageView = UIImageView(frame: CGRect(x: 16, y: 70, width: Int(widt) - 32, height: Int(widt * 1.5)))
        imageView.image = UIImage(systemName: "photo.fill")
        imageView.contentMode = .scaleAspectFit
        page.addSubview(imageView)
        page.bringSubviewToFront(imageView)
        
        let lbl = MyLabel(frame: CGRect(x: 16, y: 80, width: Int(widt) - 32, height: 50))
        lbl.text = "3rd Intro Page"
        lbl.textColor = .white
        lbl.backgroundColor = .systemGray
        lbl.layer.cornerRadius = 5
        page.addSubview(lbl)
        
        let btn = UIButton(frame: CGRect(x: Int(widt)-126, y: Int(view.frame.height) - 200, width: 110, height: 44))
        btn.setTitle("Get Started", for: .normal)
        btn.layer.cornerRadius = 5
        btn.backgroundColor = .systemBlue
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        page.addSubview(btn)
        
        return page
    }
    
    @objc func didTapButton() {
        UserDefaults.standard.set(true, forKey: "isFirstView")
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainID") as? ViewController;
        self.navigationController?.pushViewController(vc!, animated: true);
    }
    
}


// MARK: CollectionView Delegate and Datasource
extension IntroPageVC: UICollectionViewDelegate,
                       UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.addSubview(pageArr[indexPath.row])
        cell.bringSubviewToFront(pageArr[indexPath.row])
        return cell
    }
    
    // For finding indexPath and set pageController
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let indexPath = collectionView.indexPathForItem(at: visiblePoint) else { return }
        print("Current Index Path: \(indexPath)")
        pageController.currentPage = indexPath.row
        
    }
    
}

extension IntroPageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

class MyLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    
    func initializeLabel() {
        self.textAlignment = .center;
        self.font = UIFont.systemFont(ofSize: 20)
        self.textColor = UIColor.black;
    }
    
}
