//
//  ViewController.swift
//  Example
//
//  Created by leven on 2022/12/7.
//

import UIKit
import LitSwift
import SnapKit
import SafariServices
class ViewController: UIViewController {

    lazy var gotoLitButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(gotoLitButton)
        self.title = "Lit Swift"
        gotoLitButton.setTitle("Go To Lit", for: .normal)
        gotoLitButton.addTarget(self, action: #selector(gotoLitAction), for: .touchUpInside)
        gotoLitButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(20)
            make.top.equalTo(80)
            make.height.equalTo(44)
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func gotoLitAction() {
        let vc = SFSafariViewController(url: URL(string: "https://jlabsau.github.io/oauth-pkp-signup-example/")!)
//        let vc = SFSafariViewController(url: URL(string: "https://lit-relay-server.api.3wlabs.xyz:3001/")!)

    
//        let vc = LitWebViewController()
        self.present(vc, animated: true)
    }
}

