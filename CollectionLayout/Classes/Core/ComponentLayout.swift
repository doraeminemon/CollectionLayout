//
//  ComponentLayout.swift
//  CollectionViewTest
//
//  Created by JMango on 9/21/16.
//  Copyright © 2016 JMango. All rights reserved.
//

import Foundation
import UIKit

protocol ComponentLayoutDelegate {
  func component(at indexPath:IndexPath) -> ViewComponent
}

class ComponentLayout : UICollectionViewLayout {
  
  var delegate: ComponentLayoutDelegate?
  var contentHeight: CGFloat = 0
  var subviewDelegate: SubviewLayoutDelegate = VerticalSubviewLayout()
  
  fileprivate var cache:[UICollectionViewLayoutAttributes] = []
  
  
  override func prepare() {
    if cache.isEmpty {
      var horizontalOffset: CGFloat = 0
      var verticalOffset: CGFloat = 0
      var components : [ViewComponent] = []
      contentHeight = 0
      for section in 0 ..< collectionView!.numberOfSections {
        for item in 0 ..< collectionView!.numberOfItems(inSection: section) {
          let indexPath = IndexPath(item: item, section: section)
          let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
          let component = delegate!.component(at: indexPath)
          components.append(component)
      
          attributes.frame = subviewDelegate.nextFrame(component: component, superViewSize: collectionView!.frame.size)
          
          cache.append(attributes)
        }
      }
      contentHeight = subviewDelegate.contentViewFrameSize(components: components, superViewSize: collectionView!.frame.size).height
    }
    super.prepare()
  }
  
  override var collectionViewContentSize : CGSize {
    return CGSize(width: self.collectionView?.bounds.width ?? 0, height: contentHeight)
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var layoutAttributes:[UICollectionViewLayoutAttributes]  = []
    for attributes in cache {
      if attributes.frame.intersects(rect ) {
        layoutAttributes.append(attributes)
      }
    }
    return layoutAttributes
  }
  
  
  
  func resetCache(){
    cache = []
  }
  
}
