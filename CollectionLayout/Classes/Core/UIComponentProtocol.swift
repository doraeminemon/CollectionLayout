//
//  UIComponentProtocol.swift
//  CollectionViewTest
//
//  Created by JMango on 9/20/16.
//  Copyright © 2016 JMango. All rights reserved.
//

import Foundation
import UIKit

public protocol ViewComponent {
  var view: UIView { get }
  var preferedViewSize: CGSize { get set }
  var layoutAttributes: [LayoutAttribute] { get }
  
}

protocol BasicComponent { }

protocol CompositeComponent {
  var components : [ViewComponent] { get }
  var subviewDelegate : SubviewLayoutDelegate { get }
  func sizeDetermined(_ size: CGSize)
}

public enum LayoutAttribute {
  case stackable(columns: Int)
  
  case fullWidth
  case halfWidth
  
  case leftAlign
  case rightAlign
  case centered
  
  case padding(top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat)
}

extension LayoutAttribute {
  func matchCase(_ caseToMatch: LayoutAttribute) -> Bool {
    switch (self, caseToMatch){
    case (.padding(top:_, bottom:_, left:_, right:_), .padding(top:_, bottom:_, left:_, right:_)): fallthrough
    case (.stackable, .stackable): return true
    case (.fullWidth, .fullWidth): return true
    case (.halfWidth, .halfWidth): return true
    case (.leftAlign, .leftAlign): return true
    case (.rightAlign, .rightAlign): return true
    case (.centered, .centered): return true
    default: return false
    }
  }
}

