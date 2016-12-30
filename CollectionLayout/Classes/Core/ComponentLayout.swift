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
  func preferedComponentSize(at indexPath:IndexPath) -> CGSize
}

class ComponentLayout : UICollectionViewLayout {
  
  var delegate: ComponentLayoutDelegate?
  var contentHeight: CGFloat = 0
  
  fileprivate var cache:[UICollectionViewLayoutAttributes] = []
  
  override func prepare() {
    if cache.isEmpty {
      contentHeight = 0
      for section in 0 ..< collectionView!.numberOfSections {
        for item in 0 ..< collectionView!.numberOfItems(inSection: section) {
          let indexPath = IndexPath(item: item, section: section)
          let itemSizeAtIndexPath = delegate!.preferedComponentSize(at: indexPath)
          let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
          
          let x = (collectionView!.bounds.width - itemSizeAtIndexPath.width) / 2
          attributes.frame = CGRect(origin: CGPoint(x: x, y: contentHeight)
            , size: itemSizeAtIndexPath )
          cache.append(attributes)
          contentHeight += itemSizeAtIndexPath.height
        }
      }
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
