//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by JMango on 9/20/16.
//  Copyright © 2016 JMango. All rights reserved.
//

import UIKit


class CollectionLayout: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate , ComponentLayoutDelegate  {

  var components: [ViewComponent] = []
  
  func viewDidLoad() {
      (collectionViewLayout as! ComponentLayout).delegate = self
  }
  
  

  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "componentCell", for: indexPath) as! ComponentCollectionViewCell
    cell.component = components[indexPath.item]
    return cell
  }
  
  func printButtonName(_ sender:UIButton){
    print("buttonName: \(sender.description)")
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return components.count
  }
  
  func preferedComponentSize(at indexPath: IndexPath) -> CGSize {
    let item = components[indexPath.item]
    var actualSize = item.preferedViewSize
    if item.layoutAttributes.contains(.fullWidth) {
      actualSize = CGSize(width: bounds.width, height: item.preferedViewSize.height)
    }
    item.sizeDetermined(actualSize)
    return actualSize //?? CGSizeZero
  }
}




