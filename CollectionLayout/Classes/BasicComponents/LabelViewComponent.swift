//
//  LabelViewComponent.swift
//  Pods
//
//  Created by JMango on 12/28/16.
//
//

import UIKit

public class LabelViewComponent : ViewComponent {
  public var layoutAttributes: [LayoutAttribute]
  public var preferedViewSize: CGSize
  public var view: UIView
  
  var labelView: UILabel {
    return view as! UILabel
  }
  
  public var text : String? {
    didSet {
      if let text = text { labelView.text = text }
    }
  }
  
  public init(layoutAttributes: [LayoutAttribute] = [], preferedViewSize: CGSize = CGSize(width: 200, height: 30), label: UILabel = UILabel()){
    self.layoutAttributes = layoutAttributes
    self.view = label
    self.preferedViewSize = preferedViewSize
  }
  
}

public extension UILabel {
  public var asComponent : LabelViewComponent {
    return LabelViewComponent(preferedViewSize: frame.size, label: self)
  }
}
