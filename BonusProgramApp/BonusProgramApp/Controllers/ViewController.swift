//
//  ViewController.swift
//  BonusProgramApp
//
//  Created by Михайлов Александр on 08.08.2023.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var collectButton: UIView!
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Private extension
private extension ViewController {
    func setupView() {
        collectButton.layer.cornerRadius = 12
        collectButton.layer.shadowOpacity = 0.15
        collectButton.layer.shadowColor = UIColor.black.cgColor
        collectButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        collectButton.layer.shadowRadius = 8
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showCollectView))
        collectButton.addGestureRecognizer(tapGesture)
    }
    
    @objc func showCollectView() {
        let codeViewController = CodeViewController()
        navigationController?.present(codeViewController, animated: true)
    }
}
