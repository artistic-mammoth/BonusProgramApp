//
//  CodeView.swift
//  BonusProgramApp
//
//  Created by Михайлов Александр on 08.08.2023.
//

import UIKit

final class CodeView: UIView {
    // MARK: - Views
    private lazy var headerLabel: UILabel = {
        $0.textColor = .black
        $0.text = "Воспользуйтесь QR-кодом"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 13, weight: .regular)
        return $0
    }(UILabel())
    
    private lazy var codeLabel: UILabel = {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 30, weight: .bold)
        return $0
    }(UILabel())
    
    private lazy var qrImageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .black
        return $0
    }(UIImageView())
    
    private lazy var qrLabel: UILabel = {
        $0.textColor = .black
        $0.text = "или текстовым кодом"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 13, weight: .regular)
        return $0
    }(UILabel())
    
    private lazy var footprintLabel: UILabel = {
        $0.textColor = .systemGray
        $0.text = "Коды генерируются автоматически"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 13, weight: .regular)
        return $0
    }(UILabel())
    
    // MARK: - Init
    @available (*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // MARK: - Public methods
    /// update collect  view with code
    func updateView(with code: String) {
        codeLabel.text = code
        qrImageView.image = .generateQRCode(from: code)
    }
}

// MARK: - Private extension
private extension CodeView {
    func setupView() {
        addViews([headerLabel, qrImageView, codeLabel, qrLabel, footprintLabel])
        
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            
            qrImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            qrImageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 60),
            qrImageView.widthAnchor.constraint(equalToConstant: 200),
            qrImageView.heightAnchor.constraint(equalToConstant: 200),
            
            qrLabel.topAnchor.constraint(equalTo: qrImageView.bottomAnchor, constant: 30),
            qrLabel.widthAnchor.constraint(equalToConstant: 150),
            qrLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            codeLabel.topAnchor.constraint(equalTo: qrLabel.bottomAnchor, constant: 30),
            codeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            footprintLabel.topAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: 50),
            footprintLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
