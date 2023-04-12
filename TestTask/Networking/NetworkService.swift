
import UIKit

final class NetworkService {

    static let shared = NetworkService()

    private init() {}

    func getRequest(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {

        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkErrorTest.invalidURL))
            return
        }

        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkErrorTest.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkErrorTest.noData))
                return
            }

            completion(.success(data))
        }
        task.resume()
    }
}

enum NetworkErrorTest: Error {
    case invalidURL
    case invalidResponse
    case noData
}
