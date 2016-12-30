//
//  TextfieldComponent.swift
//  Pods
//
//  Created by JMango on 12/28/16.
//
//

import UIKit

public class TextFieldViewComponent : ViewComponent {
  public var layoutAttributes: [LayoutAttribute]
  public var preferedViewSize: CGSize
  public var view: UIView = { _ -> UITextField in
    let textField = UITextField()
    textField.placeholder = "Ceci est un textfield"
    return textField
  }()
  var textField : UITextField {
    return view as! UITextField
  }
  
  public var delegate : UITextFieldDelegate? {
    didSet {
      textField.delegate = delegate
    }
  }
  
  public init(layoutAttributes: [LayoutAttribute] = [.fullWidth],
              preferedViewSize: CGSize,
              tag: Int? = nil) {
    self.layoutAttributes = layoutAttributes
    self.preferedViewSize = preferedViewSize
    if let tag = tag { view.tag = tag }
  }
  
}
