//
//  ContentViewModel.swift
//  flitto_ios
//
//  Created by minkpang on 2022/01/25.
//

import Foundation
import Combine
import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var images: [ImageModel] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getImages()
    }
    
    func getImages() {
        guard let url = URL(string: "https://picsum.photos/v2/list?page=2&limit=100") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap{ data, response -> Data in
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                        throw URLError(.badServerResponse)
                    }
                return data
            }
            .decode(type: [ImageModel].self, decoder: JSONDecoder())
            .sink { completion in
                print("Completion: \(completion)")
                //                print(self.images)
            } receiveValue: { [weak self] returnedImage in
                self?.images = returnedImage
            }
            .store(in: &cancellables)
        
    }
    
    
}
