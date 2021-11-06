//
//  ImageDownloader.swift
//  IGNews
//
//  Created by subahan on 06/11/21.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String, placeHolder: UIImage? = nil) {
       
        self.image = placeHolder

        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }
        let service = BaseService()
        service.baseUrl = urlString
        NetworkManager.shared().startService(service: service, reponseObject: { error, response in
            guard let data = response?.data as? Data else {
                print(error as Any)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }
        })

    }
}
