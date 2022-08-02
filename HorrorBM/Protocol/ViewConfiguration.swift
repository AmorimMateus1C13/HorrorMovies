//
//  ViewConfiguration.swift
//  HorrorBM
//
//  Created by cynthia watanabe on 02/08/22.
//

import Foundation

protocol ViewConfiguration {
    func setupViewConfiguration()
    func buildViewHierarchy()
    func setupConstraints()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
    }
}
