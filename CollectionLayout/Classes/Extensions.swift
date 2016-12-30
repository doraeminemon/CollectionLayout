//
//  Extensions.swift
//  CollectionViewTest
//
//  Created by JMango on 9/21/16.
//  Copyright © 2016 JMango. All rights reserved.
//

import Foundation
import UIKit

public typealias Block = (() -> ())

public extension UIView {
  public class func fromNib(_ nibNameOrNil: String? = nil) -> Self {
    return fromNib(nibNameOrNil, type: self)
  }
  
  public class func fromNib<T : UIView>(_ nibNameOrNil: String? = nil, type: T.Type) -> T {
    let v: T? = fromNib(nibNameOrNil, type: T.self)
    return v!
  }
  
  public class func fromNib<T : UIView>(_ nibNameOrNil: String? = nil, type: T.Type) -> T? {
    var view: T?
    let name: String
    if let nibName = nibNameOrNil {
      name = nibName
    } else {
      // Most nibs are demangled by practice, if not, just declare string explicitly
      name = nibName
    }
    let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
    for v in nibViews! {
      if let tog = v as? T {
        view = tog
      }
    }
    return view
  }
  
  public class var nibName: String {
    let name = "\(self)".components(separatedBy: ".").first ?? ""
    return name
  }
  public class var nib: UINib? {
    if let _ = Bundle.main.path(forResource: nibName, ofType: "nib") {
      return UINib(nibName: nibName, bundle: nil)
    } else {
      return nil
    }
  }
}

public extension UIView {
  func topView() -> UIView {
    var returnValue = self
    while returnValue.superview != nil {
      returnValue = returnValue.superview!
    }
    return returnValue
  }
}

extension CGSize {
  var ratio : CGFloat {
    return width / height
  }
}

extension Array {
  typealias T = Element
  func fit<U>(other: Array<U>, body: @escaping ((T,U) -> ())) throws {
    guard self.count == other.count else {
      throw NSError()
    }
    self.enumerated().forEach { (index, element) in
      body(element, other[index])
    }
  }
}

