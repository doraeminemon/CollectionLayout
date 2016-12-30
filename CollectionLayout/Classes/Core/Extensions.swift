//
//  Extensions.swift
//  CollectionViewTest
//
//  Created by JMango on 9/21/16.
//  Copyright © 2016 JMango. All rights reserved.
//

import Foundation
import UIKit

public typealias Block = (() -> ())

public extension UIView {
  func topView() -> UIView {
    var returnValue = self
    while returnValue.superview != nil {
      returnValue = returnValue.superview!
    }
    return returnValue
  }
}

extension CGSize {
  var ratio : CGFloat {
    return width / height
  }
}

