//
//  ViewController.swift
//  OCR-Test
//
//  Created by Md. Faysal Ahmed on 4/3/23.
//

import UIKit
import MapKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var searchAddressTextField: UITextField!
        
    // text to speech
    private let synthesizer = AVSpeechSynthesizer()
    private var lastSpokenAddress: String?
    private var autoSpeak = false

    private var cameraInputView: CameraKeyboard = {
        let view = CameraKeyboard()
        return view
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()

        cameraInputView.textField = self.searchAddressTextField
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //searchAddressTextField.becomeFirstResponder()
    }

    @IBAction func goForScan(_ sender: UIButton) {
        cameraDidTap()
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        doneDidTap()
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        searchAddressTextField.resignFirstResponder()
        searchAddressTextField.text = nil
        searchAddressTextField.inputView = nil
        searchAddressTextField.reloadInputViews()
        cameraInputView.captureSession?.stopRunning()
    }
    
    
    @objc
    private func cameraDidTap() {
        searchAddressTextField.inputView = cameraInputView
        cameraInputView.startCamera()
        cameraInputView.captureSession?.startRunning()
        searchAddressTextField.becomeFirstResponder()
        searchAddressTextField.reloadInputViews()
    }

    @objc
    private func doneDidTap() {
        searchAddressTextField.resignFirstResponder()
        searchAddressTextField.inputView = nil
        searchAddressTextField.reloadInputViews()
        cameraInputView.captureSession?.stopRunning()
    }


}

