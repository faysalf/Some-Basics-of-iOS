//
//  LaunchVC.swift
//  LaunchingPage-iOS
//
//  Created by Md. Faysal Ahmed on 6/4/23.
//

import UIKit

class LaunchVC: UIViewController {
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var slides = [SlideView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkIsFirstView()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageController.numberOfPages = slides.count
        pageController.currentPage = 0
        view.bringSubviewToFront(pageController)
        
        scrollView.delegate = self
    }
    
    func checkIsFirstView() {
        if UserDefaults.standard.bool(forKey: "visitingTime") {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainID") as! ViewController
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func setupSlideScrollView(slides : [SlideView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    
    func createSlides() -> [SlideView] {
        
        let slide1 = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
        slide1.imageView.image = UIImage(systemName: "photo")
        slide1.nameOfPage.text = "First SliderView"
        
        let slide2 = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
        slide2.imageView.image = UIImage(systemName: "photo")
        slide2.nameOfPage.text = "Second SlideView"
        
        let slide3 = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
        slide3.imageView.image = UIImage(systemName: "photo")
        slide3.nameOfPage.text = "Third SlideView"
        
        let slide4 = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
        slide4.imageView.image = UIImage(systemName: "photo.fill")
        slide4.nameOfPage.text = "Fourth SlideView"
        
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.frame = CGRect(x: Int(view.frame.width) - 74, y: Int(pageController.frame.minY) - 60, width: 60, height: 44)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(homePageVC), for: .touchUpInside)
        slide4.addSubview(button)
        
        return [slide1, slide2, slide3, slide4]
    }
    
    @objc func homePageVC() {
        UserDefaults.standard.set(true, forKey: "visitingTime")
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainID") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension LaunchVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 || scrollView.contentOffset.y < 0 {
                scrollView.contentOffset.y = 0
             }
        pageController.currentPage = Int(floorf(Float(scrollView.contentOffset.x)/Float(scrollView.frame.size.width)));
    }
    
}
