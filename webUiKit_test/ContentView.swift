//
//  ContentView.swift
//  webUiKit_test
//
//  Created by Jason Anthony on 12/18/23.
//

import SwiftUI
import WebKit
import SafariServices


import UIKit
import SafariServices

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = ViewController()
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update the view controller if needed
    }
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    var openButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createButton()
    }
    
    func createButton() {
        // Create a button
        openButton = UIButton(type: .system)
        openButton.setTitle("Open", for: .normal)
        openButton.addTarget(self, action: #selector(openButtonTapped), for: .touchUpInside)
        
        // Set button frame
        openButton.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        
        // Add button to the view
        view.addSubview(openButton)
    }
    

    @objc func openButtonTapped() {
        // URL to open in Safari
        guard let url = URL(string: "https://www.underarmour.com") else {
            return
        }
        
        // Create Safari view controller
        let safariViewController = SFSafariViewController(url: url)
        
        // Present the Safari view controller
        present(safariViewController, animated: true, completion: nil)
    }
}


struct ContentView: View {
    var body: some View {
        ViewControllerRepresentable()
    }
}

#Preview {
    ViewController()
}
