//
//  StackViewComponent.swift
//  Pods
//
//  Created by JMango on 12/28/16.
//
//

import UIKit

public class StackViewComponent : ViewComponent, CompositeComponent {
  public var layoutAttributes: [LayoutAttribute]
  public var preferedViewSize: CGSize
  public var view: UIView = { _ -> UIView in
    let view = UIView()
    view.layer.cornerRadius = 10
    view.clipsToBounds = true
    return view
  }()
  
  public var components: [ViewComponent]
  public var subviewDelegate : SubviewLayoutDelegate
  
  public init(_ components: [ViewComponent],
              layoutAttributes: [LayoutAttribute] = [],
              preferedViewSize: CGSize,
              subviewDelegate: SubviewLayoutDelegate = VerticalSubviewLayout()){
    self.layoutAttributes = layoutAttributes
    self.components = components
    self.subviewDelegate = subviewDelegate
    self.preferedViewSize = preferedViewSize
    layoutViews()
    self.preferedViewSize = subviewDelegate.contentViewFrameSize(components: components, superViewSize: preferedViewSize)
  }
  
  public func sizeDetermined(_ size: CGSize) {
  }
  
}
