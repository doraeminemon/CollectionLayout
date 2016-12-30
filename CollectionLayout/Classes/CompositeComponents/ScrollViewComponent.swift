//
//  ScrollViewComponent.swift
//  Pods
//
//  Created by JMango on 12/28/16.
//
//

import UIKit

public class ScrollViewComponent : ViewComponent, CompositeComponent {
  public var layoutAttributes: [LayoutAttribute]
  public var preferedViewSize: CGSize
  public var view: UIView = { _ -> UIView in
    var scrollView = UIScrollView(frame:.zero)
    scrollView.backgroundColor = UIColor.white
    scrollView.isScrollEnabled = true
    scrollView.showsVerticalScrollIndicator = false
    return scrollView
  }()
  var scrollView: UIScrollView { return view as! UIScrollView }
  var components: [ViewComponent]
  
  var subviewDelegate : SubviewLayoutDelegate
  
  public init(_ components: [ViewComponent],
       preferedViewSize : CGSize = CGSize(width: 800, height: 200),
       attributes : [LayoutAttribute] = [.fullWidth],
       subviewDelegate: SubviewLayoutDelegate = HorizontalSubviewLayout()){
    self.components = components
    self.preferedViewSize = preferedViewSize
    self.layoutAttributes = attributes
    self.subviewDelegate = subviewDelegate
    layoutViews()
    scrollView.contentSize = subviewDelegate.contentViewFrameSize(components: components, superViewSize: preferedViewSize)
  }
  
  public func sizeDetermined(_ size: CGSize) {
    
  }
}
