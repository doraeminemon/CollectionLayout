//
//  SubviewLayoutDelegate.swift
//  Pods
//
//  Created by JMango on 12/29/16.
//
//

import UIKit

extension ViewComponent where Self: CompositeComponent {
  func layoutViews(){
    components.enumerated().forEach { (index, component) in
      component.view.frame = subviewDelegate.nextFrame(component: component, superViewSize: preferedViewSize)
      view.addSubview(component.view)
    }
  }
}

public protocol SubviewLayoutDelegate {
  //MUST CALL NEXTFRAME FOR ALL COMPONENTS BEFORE RUNNING CONTENTVIEWFRAMESIZE
  func contentViewFrameSize(components: [ViewComponent], superViewSize: CGSize) -> CGSize
  func nextFrame(component: ViewComponent, superViewSize: CGSize) -> CGRect
}
