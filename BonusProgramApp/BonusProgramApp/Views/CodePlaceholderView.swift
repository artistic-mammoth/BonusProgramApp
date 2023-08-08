//
//  CodePlaceholderView.swift
//  BonusProgramApp
//
//  Created by Михайлов Александр on 08.08.2023.
//

import UIKit
import Lottie

final class CodePlaceholderView: UIView {
    // MARK: - Views
    private lazy var loadingAnimatedIcon: LottieAnimationView = {
        $0.loopMode = .loop
        $0.contentMode = .scaleAspectFit
        $0.animationSpeed = 1.2
        return $0
    }(LottieAnimationView())
    
    private lazy var generatingLabel: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        $0.text = "QR-код создается..."
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    // MARK: - Init
    @available (*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
}

// MARK: - Private extension
private extension CodePlaceholderView {
    func setupView() {
        addViews([loadingAnimatedIcon, generatingLabel])
        
        let animationsNames = CatalogLottie.names
        
        loadingAnimatedIcon.animation = LottieAnimation.named(animationsNames[Int.random(in: 0..<animationsNames.count)])
        loadingAnimatedIcon.play()
        
        NSLayoutConstraint.activate([
            loadingAnimatedIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingAnimatedIcon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            loadingAnimatedIcon.widthAnchor.constraint(equalToConstant: 300),
            loadingAnimatedIcon.heightAnchor.constraint(equalToConstant: 300),
            
            generatingLabel.topAnchor.constraint(equalTo: loadingAnimatedIcon.bottomAnchor, constant: 30),
            generatingLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
