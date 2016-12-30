//
//  UIComponentProtocol.swift
//  CollectionViewTest
//
//  Created by JMango on 9/20/16.
//  Copyright © 2016 JMango. All rights reserved.
//

import Foundation
import UIKit

protocol ViewComponent {
  var view: UIView { get }
  var preferedViewSize: CGSize { get set }
  var layoutAttributes: [LayoutAttribute] { get }
  
  func sizeDetermined(_ size: CGSize)
}

protocol ControlComponent {
//  associatedtype Interface : ViewComponent
//  var interface : Interface? { get }
}


protocol BasicComponent { }

protocol CompositeComponent {
  var components : [ViewComponent] { get }
}

enum LayoutAttribute {
  case fullWidth
  case compactWidth
  case stackable
}

//struct AnyControlComponent<SpecificViewComponent: ViewComponent> : ControlComponent {
//  var interface : SpecificViewComponent?
//}

