//
//  HomePageViewController.swift
//  LoginSample
//
//  Created by Pierce Gallego on 11/21/23.
//

import Foundation
import UIKit

class HomePageViewController: UIViewController {
    
    
    @IBOutlet weak var welcomeString: UILabel!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcomeString.text = "Hello, \(self.user.username!)"
        
    }
    
    @IBAction func logoutButtonPushed (_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let rootNavigationView = storyboard.instantiateViewController(withIdentifier: "RootNavigation") as! UINavigationController
        UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.flatMap { $0.windows }.first { $0.isKeyWindow }?.rootViewController = rootNavigationView
    }
}
