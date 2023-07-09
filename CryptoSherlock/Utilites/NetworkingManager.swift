//
//  NetworkingManager.swift
//  CryptoSherlock
//
//  Created by RAFAEL on 09.07.2023.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[🔥] Bad response from URL: \(url)"
            case .unknown: return "[⚠️] Unknown error occured."
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, any Error> {
        return URLSession.shared.dataTaskPublisher(for: url)  // jump by url address
            .subscribe(on: DispatchQueue.global(qos: .default)) // subscribed to the background thread
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output:  URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
        
    }
    
    static func handleCompletion(
        completion: Subscribers.Completion<Publishers.Decode<AnyPublisher<Data,Error>,
        [CoinModel], JSONDecoder>.Failure>) {
            switch completion {
            case .finished:
                break
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    
}
