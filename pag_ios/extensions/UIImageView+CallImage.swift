//
//  UIImageView+CallImage.swift
//  pag_ios
//
//  Created by William Vux on 14/10/24.
//

import UIKit

extension UIImageView {
    func loadImage(uri: String?) {
        guard let uri = uri else {
            self.image = UIImage(systemName: "photo.fill")
            return
        }
        guard let url = URL(string: uri) else {
            self.image = UIImage(systemName: "photo.fill")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let dataImage = data else {
                DispatchQueue.main.async {
                    self.image = UIImage(systemName: "photo.fill")
                }
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: dataImage)
            }
        }.resume()
        
    }
}
