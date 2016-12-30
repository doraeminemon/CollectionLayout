//
//  ButtonViewComponent.swift
//  Pods
//
//  Created by JMango on 12/28/16.
//
//

import UIKit

public class ButtonViewComponent : NSObject,  ViewComponent {
  public var layoutAttributes: [LayoutAttribute]
  public var preferedViewSize: CGSize
  public var view: UIView
//    = { _ -> UIButton in
//    let button = UIButton()
//    return button
//  }()
  var buttonView : UIButton {
    return view as! UIButton
  }
  
  public var delegate: UIButtonDelegate?
  
  public init(layoutAttributes: [LayoutAttribute] = [],
       preferedViewSize: CGSize,
       button: UIButton,
       tag: Int? = nil) {
    self.preferedViewSize = preferedViewSize
    self.layoutAttributes = layoutAttributes
    self.view = button
    if let tag = tag { view.tag = tag }
    super.init()
    buttonView.addTarget(self, action: #selector(touchUpInside(_:)), for: .touchUpInside)
    buttonView.addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
  }

  func touchDown(_ sender: UIButton) {
    delegate?.touchDown(sender)
  }
  
  func touchUpInside(_ sender: UIButton){
    delegate?.touchUpInside(sender)
  }
}

public extension UIButton {
  public var asComponent : ButtonViewComponent {
    return ButtonViewComponent(preferedViewSize: frame.size, button: self)
  }
}

public protocol UIButtonDelegate {
  func touchUpInside(_ sender: UIButton)
  func touchDown(_ sender: UIButton)
}
