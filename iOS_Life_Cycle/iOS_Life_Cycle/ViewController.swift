//
//  ViewController.swift
//  Life Cycle of iOS development
//
//  Created by Md. Faysal Ahmed on 24/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("It's call only one and early first")
    }
    
    @IBAction func btn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SecondViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController;
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Initial ViewController: It's call after viewDidLoad and for initial view")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("Initial ViewController: It's call after viewWillAppear and for initial view, if subViews available. Other's viewController e jawar age 1st call hoy.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Initial ViewController: It's call after viewWillLayoutSubviews and for initial view.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Eta call hobe jokhon main ViewController theke onyo VC e jabe. Other's viewController er ViewDidLoad call howar por eta call hoy.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("It'll be call when the page have successfully transefered. Eta call hobe jokhon 2nd viewController er viewDidAppear call shesh hobe.")
    }
 


}

