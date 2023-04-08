//
//  NetworkService.swift
//  TestTask
//
//  Created by Sergio on 7.04.23.
//

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


//final class NetworkDataFetch {
//
//    static let shared = NetworkDataFetch()
//
//    private init() {}
//
//    func fetchAlbum(urlString: String, responce: @escaping (ModelLatest?, Error?) -> Void) {
//
//        NetworkService.shared.getRequest(urlString: urlString) { result in
//
//            switch result {
//            case .success(let data):
//                do {
//                    let albums = try JSONDecoder().decode(ModelLatest.self, from: data)
//                    responce(albums, nil)
//                } catch let jsonError {
//                    print("Failed to decode JSON", jsonError)
//                }
//            case .failure(let error):
//                print("Error received requesting data: \(error.localizedDescription)")
//                responce(nil, error)
//            }
//        }
//    }
//
//    func fetchFlashScale(urlString: String, responce: @escaping (ModelFlashSale?, Error?) -> Void) {
//
//        NetworkService.shared.getRequest(urlString: urlString) { result in
//
//            switch result {
//            case .success(let data):
//                do {
//                    let albums = try JSONDecoder().decode(ModelFlashSale.self, from: data)
//                    responce(albums, nil)
//                } catch let jsonError {
//                    print("Failed to decode JSON", jsonError)
//                }
//            case .failure(let error):
//                print("Error received requesting data: \(error.localizedDescription)")
//                responce(nil, error)
//            }
//        }
//    }
//
//    func fetchImageLatest(model: Latest, imageView: UIImageView) {
//        if let imageUrl = model.imageURL, let url = URL(string: imageUrl) {
//            let session = URLSession.shared
//
//            let task = session.dataTask(with: url) { data, response, error in
//                if let data = data, let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        imageView.image = image
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//
//    func fetchImageFlashSale(model: FlashSale, imageView: UIImageView) {
//        if let imageUrl = model.imageURL, let url = URL(string: imageUrl) {
//            let session = URLSession.shared
//
//            let task = session.dataTask(with: url) { data, response, error in
//                if let data = data, let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        imageView.image = image
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//}
