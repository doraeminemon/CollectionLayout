//
//  ImageViewComponent.swift
//  Pods
//
//  Created by JMango on 12/28/16.
//
//

import UIKit

public class ImageViewComponent : ViewComponent {
  public var view: UIView = { _ -> UIImageView in
    let imageView = UIImageView()
    return imageView
  }()
  public var layoutAttributes : [LayoutAttribute]
  public var preferedViewSize : CGSize
  var imageView : UIImageView {
    return (view as! UIImageView)
  }
  
  public var image : UIImage? {
    didSet{
      imageView.image = image
    }
  }
  
  public init(layoutAttributes : [LayoutAttribute] = [],
              preferedViewSize: CGSize,
              tag: Int? = nil){
    self.preferedViewSize = preferedViewSize
    self.layoutAttributes = layoutAttributes
    if let tag = tag { view.tag = tag }
  }
  
}
