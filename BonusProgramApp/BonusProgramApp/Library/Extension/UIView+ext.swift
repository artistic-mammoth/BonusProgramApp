//
//  UIView+ext.swift
//  BonusProgramApp
//
//  Created by Михайлов Александр on 08.08.2023.
//

import UIKit

extension UIView {
    /// add views and prepare for AutoLayout
    func addViews(_ views: [UIView]) {
        for v in views {
            addViews(v)
        }
    }
    
    /// add views and prepare for AutoLayout
    func addViews(_ v: UIView) {
        self.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
    }
}
