//
//  GetApiImage.swift
//  EvoGameAppp
//
//  Created by sixpep on 30/03/23.
//

import Foundation
import UIKit

class GetApiImage{
    func setBackG(urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let image = UIImage(data: data)
            completion(image)
        }

        task.resume()
    }
}
