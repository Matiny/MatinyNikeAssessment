//
//  UIView.swift
//  MatinyNikeChallenge
//
//  Created by Matiny L on 10/22/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView ...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}
