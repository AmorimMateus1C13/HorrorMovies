//
//  ViewController.swift
//  HorrorBM
//
//  Created by Mateus Amorim on 02/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTest: UILabel!
    
    @IBOutlet weak var textFieldTest: UITextField!
    
    var movieManager = MoviesManager()
    var dataM: DataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieManager.delegate = self
        textFieldTest.placeholder = "What movie do you want know?"
    }

    @IBAction func serchPressed(_ sender: UIButton) {
        if let movie = textFieldTest.text {
            movieManager.searchMovies(movie)
        }
        
    }
}
extension ViewController: MoviesDelegateProtocol {
     
    func didUpdate(_ requisitorDeAPR: MoviesManager, condicoes: APIModel) {
        // Mostrará na tela.
        DispatchQueue.main.async {
            self.labelTest.text = condicoes.overview
        }
//        labelTest.text = condicoes.overview
    }
    
    func didFailwithError(error: Error) {
        let coment = "Não há informações sobre o filme"
        print("Problemas com o DidFailWithError. Erro: \(error)")
        
    }
    
    
    
}

