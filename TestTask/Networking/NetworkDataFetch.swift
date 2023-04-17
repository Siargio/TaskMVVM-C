import UIKit

final class NetworkDataFetch {

    static let shared = NetworkDataFetch()

    private init() {}

    func fetchAlbum(urlString: String, responce: @escaping (ModelLatest?, Error?) -> Void) {

        NetworkService.shared.getRequest(urlString: urlString) { result in

            switch result {
            case .success(let data):
                do {
                    let albums = try JSONDecoder().decode(ModelLatest.self, from: data)
                    responce(albums, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                responce(nil, error)
            }
        }
    }

    func fetchFlashScale(urlString: String, responce: @escaping (ModelFlashSale?, Error?) -> Void) {

        NetworkService.shared.getRequest(urlString: urlString) { result in

            switch result {
            case .success(let data):
                do {
                    let albums = try JSONDecoder().decode(ModelFlashSale.self, from: data)
                    responce(albums, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                responce(nil, error)
            }
        }
    }
}
