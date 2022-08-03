import Foundation

protocol MoviesDelegateProtocol {
    func didUpdate(_ requisitorDeAPR: MoviesManager, condicoes: APIModel)
    func didFailwithError(error: Error)
}

struct MoviesManager {
    var delegate: MoviesDelegateProtocol?
    let urlSearch = "https://api.themoviedb.org/3/search/movie?"
    let apiKey = "api_key=cd794b67e34b75b499f106ac8e7f186e"
    let language = "&language=pt-BR"
    

    func searchMovies (_ movieSearch: String) {
        // Usuário vai digitar qual filme deseja
        let trimmedString = movieSearch.replacingOccurrences(of: " ", with: "")
        print(trimmedString)
        let urlString = "\(urlSearch)\(apiKey)\(language)&query=\(trimmedString)"
        performRequest(with: urlString)
        print(urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailwithError(error: error!)
                    print("Erro no performRequest: \(error!)")
                    return
                }
                if let safeData = data {
                    if let movie = self.parseJSON(dataModel: safeData) {
                        self.delegate?.didUpdate(self, condicoes: movie)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON (dataModel: Data) -> APIModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(DataModel.self, from: dataModel)
            let ide = decodedData.results[0].id
            let lang = decodedData.results[0].original_language
            let titleOrig = decodedData.results[0].original_title
            let descr = decodedData.results[0].overview
            let pop = decodedData.results[0].popularity
            let title = decodedData.results[0].title
            print("\(ide), \(lang), \(titleOrig), \(descr), \(pop), \(title)")
            let movieData = APIModel(
                id: ide,
                original_language: lang,
                original_title: titleOrig,
                overview: descr,
                popularity: pop,
                title: title)
            return movieData
        }catch {
            delegate?.didFailwithError(error: error)
            print("Erro no ParseJSON: \(error)")
            return nil
        }
    }
}
