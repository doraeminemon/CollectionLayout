//
//  ComponentCollectionViewCell.swift
//  CollectionViewTest
//
//  Created by JMango on 9/21/16.
//  Copyright © 2016 JMango. All rights reserved.
//

import Foundation
import UIKit

class ComponentCollectionViewCell : UICollectionViewCell {
  var component: ViewComponent?
    {
    didSet {
      if let componentView = component?.view {
        componentView.center = self.center
        componentView.frame = CGRect(origin: CGPoint.zero, size: frame.size)
        self.addSubview(componentView)
      }
    }
  }
  
  override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
    super.apply(layoutAttributes)
    
  }
}
