//
//  LitManager.swift
//  LitSwift
//
//  Created by leven on 2022/12/15.
//

import Foundation
import SafariServices
public class LitManager {
    
    public static func getPKPByGoogleOAuth(_ from:  UIViewController) {
        let vc = SFSafariViewController(url: URL(string: "https://jlabsau.github.io/oauth-pkp-signup-example/")!)
//        let vc = SFSafariViewController(url: URL(string: "https://lit-relay-server.api.3wlabs.xyz:3001/")!)
        from.present(vc, animated: true)
    }
}
