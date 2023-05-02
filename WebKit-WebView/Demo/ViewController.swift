import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    lazy var vieww: UIView = {
        let vw = UIView()
        vw.backgroundColor = .systemBlue
        return vw
    }()
    
    @IBOutlet weak var lbl: UILabel!
    var webView: WKWebView!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupView()
        let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    private func setupView() {
        vieww.frame = CGRect(x: 16, y: 60, width: view.frame.width - 32, height: view.frame.height-60)
        view.addSubview(vieww)
    }
    
    @IBAction func btnAction(sender: UIButton) {
        
        
    }
    
}
