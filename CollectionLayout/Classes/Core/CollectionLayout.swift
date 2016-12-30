//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by JMango on 9/20/16.
//  Copyright © 2016 JMango. All rights reserved.
//

import UIKit


public class CollectionLayout: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate , ComponentLayoutDelegate  {

  public var components: [ViewComponent] = [] {
    didSet {
      reloadData()
    }
  }
  
  var componentLayout : ComponentLayout {
    return (collectionViewLayout as! ComponentLayout)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder : aDecoder)
    collectionViewLayout = ComponentLayout()
    (collectionViewLayout as! ComponentLayout).delegate = self
    delegate = self
    dataSource = self
    register(ComponentCollectionViewCell.self, forCellWithReuseIdentifier: "componentCell")
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "componentCell", for: indexPath) as! ComponentCollectionViewCell
    cell.component = components[indexPath.item]
    return cell
  }
  
  
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return components.count
  }
  
  
  func component(at indexPath: IndexPath) -> ViewComponent {
    return components[indexPath.item]
  }
  
  public override func reloadData() {
    componentLayout.resetCache()
    super.reloadData()
  }
}




