//
//  CodeViewController.swift
//  BonusProgramApp
//
//  Created by Михайлов Александр on 08.08.2023.
//

import UIKit

final class CodeViewController: UIViewController {
    // MARK: - Views
    private var loadingPlaceholder: CodePlaceholderView?
    private lazy var collectCodeView: CodeView = CodeView()
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
}

// MARK: - Private extension
private extension CodeViewController {
    func setupView() {
        addPlaceHolder()
        view.addViews(collectCodeView)
        
        collectCodeView.isHidden = true
        
        NSLayoutConstraint.activate([
            collectCodeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectCodeView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectCodeView.heightAnchor.constraint(equalTo: view.heightAnchor),
            collectCodeView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
        CodeGeneratorService.shared.getCode(completion: { [weak self] (code) in
            DispatchQueue.main.async {
                self?.removePlaceHolder()
                self?.collectCodeView.isHidden = false
                self?.collectCodeView.updateView(with: code)
            }
        })
    }
    
    func addPlaceHolder() {
        loadingPlaceholder = CodePlaceholderView()
        guard let loadingPlaceholder = loadingPlaceholder else { return }
        view.addSubview(loadingPlaceholder)
        loadingPlaceholder.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loadingPlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingPlaceholder.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingPlaceholder.heightAnchor.constraint(equalTo: view.heightAnchor),
            loadingPlaceholder.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
    
    func removePlaceHolder() {
        loadingPlaceholder?.removeFromSuperview()
        loadingPlaceholder = nil
    }
}
