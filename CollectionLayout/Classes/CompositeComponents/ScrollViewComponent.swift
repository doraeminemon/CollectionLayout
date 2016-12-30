//
//  ScrollViewComponent.swift
//  Pods
//
//  Created by JMango on 12/28/16.
//
//

import UIKit

public enum ScrollViewOptions {
  case paged
}

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
  var options : [ScrollViewOptions]
  
  var components: [ViewComponent]
  
  public init(_ components: [ViewComponent],
       size : CGSize = CGSize(width: 800, height: 200),
       attributes : [LayoutAttribute] = [.fullWidth],
       options: [ScrollViewOptions] = []){
    self.components = components
    self.preferedViewSize = size
    self.layoutAttributes = attributes
    self.options = options
    self.components = convert(components: self.components)
    if options.contains(.paged){
      scrollView.isPagingEnabled = true
    }
  }
  
  func loadView(_ actualSize:CGSize ) {
    scrollView.contentSize = calculatingContentSize(size: actualSize)
    add(components: self.components, size: actualSize)
  }
  
  func calculatingContentSize(size: CGSize) -> CGSize {
    let totalHeight : CGFloat = size.height
    var totalWidth : CGFloat = 0
    if options.contains(.paged) {
      totalWidth = size.width * CGFloat(components.count)
    } else {
      components.forEach { (component) in
        totalWidth += component.preferedViewSize.width
      }
    }
    return CGSize(width: totalWidth, height: totalHeight)
  }
  
  func convert(components: [ViewComponent]) -> [ViewComponent] {
    return components.map { component -> ViewComponent in
      var componentCopy = component
      if component.preferedViewSize.height > self.preferedViewSize.height {
        componentCopy.preferedViewSize.height = self.preferedViewSize.height
        componentCopy.preferedViewSize.width = self.preferedViewSize.height * component.preferedViewSize.ratio
        return componentCopy
      } else {
        return componentCopy
      }
    }
  }
  
  func add(components: [ViewComponent], size: CGSize){
    var horizontalOffset : CGFloat = 0
    if options.contains(.paged) {
      components.forEach{ (component) in
        let verticalOffset: CGFloat = ( size.height - component.preferedViewSize.height ) / 2
        let horizontalSpacing : CGFloat = horizontalOffset + ( size.width - component.preferedViewSize.width ) / 2
        component.view.frame = CGRect(origin: CGPoint(x: horizontalSpacing, y: verticalOffset), size: component.preferedViewSize)
        view.addSubview(component.view)
        horizontalOffset += size.width
      }
    } else {
      components.forEach { (component) in
        let verticalOffset: CGFloat = 0
        component.view.frame = CGRect(origin: CGPoint(x: horizontalOffset, y:verticalOffset ), size: component.preferedViewSize)
        self.view.addSubview(component.view)
        horizontalOffset += component.view.bounds.width
      }
    }
  }
  
  public func sizeDetermined(_ size: CGSize) {
    loadView(size)
  }
}
