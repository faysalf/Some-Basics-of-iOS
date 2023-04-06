//
//  SecondViewController.swift
//  iOS_Life_Cycle
//
//  Created by Md. Faysal Ahmed on 2/12/22.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("It's call after viewDidLoad and for initial view")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("It's call after viewWillAppear and for initial view")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Secondary ViewController: It's call after viewWillLayoutSubviews and for initial view.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Eta call hobe jokhon main page theke onyo page e jabe")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("It'll be call when the page have successfully transefered. Eta call hobe jokhon 2nd viewController er viewDidAppear call shesh hobe.")
    }
 


}
