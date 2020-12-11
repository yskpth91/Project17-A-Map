//
//  DetailViewModel.swift
//  NaverMapA
//
//  Created by 홍경표 on 2020/12/03.
//

import Foundation
import UIKit

final class DetailViewModel: NSObject {
    
    var identifier = UUID()
    
    var name: Dynamic<String>
    
    var latitude: Dynamic<Double>
    
    var longitude: Dynamic<Double>
    
    var address: Dynamic<String>
    
    var item: Dynamic<Item>
    
    init(place: Place) {
        self.name = .init(place.name)
        self.latitude = .init(place.latitude)
        self.longitude = .init(place.longitude)
        self.address = .init("불러오는 중")
        if let url = URL(string: place.imageUrl ?? "") {
            self.item = .init(Item(image: UIImage(systemName: "hourglass")!, url: url))
        } else {
            self.item = .init(Item(image: UIImage(systemName: "xmark.circle")!, url: nil))
        }
    }
    
}

class Item {
    
    var image: UIImage!
    let url: URL?
    let identifier = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    init(image: UIImage, url: URL? = nil) {
        self.image = image
        self.url = url
    }
    
}
