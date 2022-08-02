//
//  SearchMovieViewController.swift
//  HorrorBM
//
//  Created by cynthia watanabe on 02/08/22.
//

import Foundation
import UIKit

class SearchMovieViewController: UIViewController {
    
    let mainView = SearchMovieView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tela de busca"
        view.addSubview(mainView)
        makeConstraint()
//        view.backgroundColor = .blue
    }
    
    func makeConstraint() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
