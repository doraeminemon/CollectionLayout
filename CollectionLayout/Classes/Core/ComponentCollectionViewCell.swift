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
      if let component = component {
        setUpComponent(component)
      }
    }
  }
    
  func setUpComponent(_ component: ViewComponent){
    let layoutAttributes = component.layoutAttributes
//    guard isValid(layoutAttributes: layoutAttributes) else {
//      print("Invalid layout attribute - view won't be rendered")
//      return
//    }
//    if layoutAttributes.contains(.centered){
//      component.view.center = self.center
//    } else if layoutAttributes.contains(.leftAlign) {
//      component.view.frame.origin = .zero
//    } else if layoutAttributes.contains(.rightAlign) {
//      component.view.frame.origin = CGPoint(x: frame.width - component.view.frame.width, y: 0)
//    }
    component.view.frame.size = frame.size
    self.addSubview(component.view)
  }
  
  func isValid(layoutAttributes: [LayoutAttribute]) -> Bool{
    let alignmentAttributes : [LayoutAttribute] = [.centered, .leftAlign, .rightAlign]
    var attributeCounter : Int = 0
    for attribute in alignmentAttributes {
      if layoutAttributes.contains(where: {$0.matchCase(attribute)}) {
        attributeCounter += 1
      }
    }
    if attributeCounter > 1 {
      print("More than 1 alignment attribute")
      return false
    } else {
      return true
    }
  }
  
}
