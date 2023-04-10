//
//  ViewController.swift
//  AutoScrollCVwithUserInteraction
//
//  Created by Md. Faysal Ahmed on 10/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    // Timer for auto-scrolling
    var autoScrollTimer: Timer?
    var isManuallyScrolling = false
    
    let color: [UIColor] = [.red, .green, .black, .white, .systemBlue, .systemPink, .systemBrown, .systemGray4, .yellow, .systemYellow, .purple, .systemPurple]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        pageController.numberOfPages = color.count
        
        startAutoScrollTimer()
    }
    
    func startAutoScrollTimer() {
        autoScrollTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [weak self] (_) in
            self?.scrollToNextIndex()
        }
    }
    
    func scrollToNextIndex() {
        guard let currentIndexPath = collectionView.indexPathsForVisibleItems.sorted().last else {
            return
        }
        
        var nextIndexPath = IndexPath(item: currentIndexPath.item + 1, section: currentIndexPath.section)
        if nextIndexPath.item >= collectionView.numberOfItems(inSection: nextIndexPath.section) {
            nextIndexPath = IndexPath(item: 0, section: nextIndexPath.section)
        }
        
        collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    func stopAutoScrollTimer() {
        autoScrollTimer?.invalidate()
        autoScrollTimer = nil
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        stopAutoScrollTimer()
        isManuallyScrolling = true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startAutoScrollTimer()
        isManuallyScrolling = false
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return color.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = color[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
}
