//
//  SearchMovieView.swift
//  HorrorBM
//
//  Created by cynthia watanabe on 02/08/22.
//

import Foundation
import UIKit
import SnapKit

class SearchMovieView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "testes"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchMovieView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.trailing.leading.equalToSuperview().offset(16)
        }
    }
}
