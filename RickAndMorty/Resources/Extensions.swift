//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Obinna Aguwa on 21/02/2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
