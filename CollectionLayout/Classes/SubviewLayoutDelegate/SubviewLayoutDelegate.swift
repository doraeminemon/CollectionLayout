//
//  SubviewLayoutDelegate.swift
//  Pods
//
//  Created by JMango on 12/29/16.
//
//

import UIKit

extension ViewComponent & CompositeComponent {
  
}

public protocol SubviewLayoutDelegate {
  func nextSubviewFrame() -> CGRect
}
