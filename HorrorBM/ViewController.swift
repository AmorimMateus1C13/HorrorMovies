//
//  ViewController.swift
//  HorrorBM
//
//  Created by Mateus Amorim on 02/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        let controller = SearchMovieViewController()
        self.addChild(controller)
        view.addSubview(controller.view)
        controller.didMove(toParent:self)
    }
}

