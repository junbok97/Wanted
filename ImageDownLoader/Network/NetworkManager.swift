//
//  NetworkManager.swift
//  ImageDownLoader
//
//  Created by 이준복 on 2023/02/27.
//

import UIKit


final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    let urlString = "https://picsum.photos/300"
    
    func getImage(completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else {
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }
    }
    
}
