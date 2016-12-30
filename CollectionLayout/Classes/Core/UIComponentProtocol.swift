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
  
  func sizeDetermined(_ size: CGSize)
}

protocol BasicComponent { }

protocol CompositeComponent {
  var components : [ViewComponent] { get }
}

public enum LayoutAttribute {
  case fullWidth
  case compactWidth
  case stackable
}

