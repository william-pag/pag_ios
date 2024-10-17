//
//  Observable.swift
//  pag_ios
//
//  Created by William Vux on 15/10/24.
//

import Foundation

final class Observable<T> {
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    init(_ value: T? = nil) {
        self.value = value
    }
    private var listener: ((T?) -> Void)?
    
    func bind(listener: @escaping ((T?) -> Void)) {
        listener(self.value)
        self.listener = listener
    }
}
