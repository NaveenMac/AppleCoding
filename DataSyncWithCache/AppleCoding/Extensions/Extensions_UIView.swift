//
//  Extensions_UIView.swift
//  AppleCoding
//
//  Created by Naveen Chauhan on 10/11/21.
//

import UIKit

extension UIView {
    static func VStack(spacing:CGFloat,alignment:UIStackView.Alignment = .top, distribution:UIStackView.Distribution)->UIStackView{
           let stack = UIStackView()
           stack.axis = .vertical
           stack.spacing = spacing
           stack.alignment = alignment
           stack.distribution = distribution
           return stack
       }
       
      static func HStack(spacing:CGFloat,alignment:UIStackView.Alignment = .leading, distribution:UIStackView.Distribution)->UIStackView{
           let stack = UIStackView()
           stack.axis = .horizontal
           stack.alignment = alignment
           stack.spacing = spacing
           stack.distribution = distribution
           return stack
       }
}
