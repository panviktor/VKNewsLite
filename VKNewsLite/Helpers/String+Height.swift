//
//  String+Height.swift
//  VKNewsLite
//
//  Created by Виктор on 28.03.2020.
//  Copyright © 2020 SwiftViktor. All rights reserved.
//

import UIKit

extension String {
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        
        let size = self.boundingRect(with: textSize,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font : font],
                                     context: nil)
        return ceil(size.height)
    }
}

