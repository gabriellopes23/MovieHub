
import UIKit

enum NetworkError: Error {
    case serverError
    case decodingError
}

struct FilmeResponse: Codable {
    let results: [FilmeModel]
}

struct FilmeModel: Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}

extension HomeViewController {
    func fetchFilme(completion: @escaping(Result<[FilmeModel],NetworkError>) -> Void) {
        
        let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYjc4Mjk3NTEzNjk4MDI1N2JiMTM0NTMyZDlhOGFjNSIsIm5iZiI6MS43MTg3MzQ1MzI5NDIwMDAyZSs5LCJzdWIiOiI2NjcxY2VjNDVlNGZiZTQwYjQ5OWUyNjIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.RCX4Ap-ETCkgMC7oRSi4WyseSVnMe2JlqL2_3WCcTqs"
        let baseURL = "https://api.themoviedb.org/3/movie/popular"
        
        guard let url = URL(string: baseURL) else {
            completion(.failure(.serverError))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    
                    let filmes = try decoder.decode(FilmeResponse.self, from: data)
                    completion(.success(filmes.results))
                    print("Successo")
                } catch {
                    completion(.failure(.decodingError))
                    print("Error de dados")
                }
            }
        }.resume()
    }
}
