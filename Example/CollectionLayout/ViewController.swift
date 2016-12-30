//
//  ViewController.swift
//  CollectionLayout
//
//  Created by Do Son on 12/28/2016.
//  Copyright (c) 2016 Do Son. All rights reserved.
//

import UIKit
import CollectionLayout

class ViewController: UIViewController, UITextFieldDelegate, UIButtonDelegate, UIWebViewDelegate {

  @IBOutlet var collectionView: CollectionLayout!
  
  var components : [ViewComponent] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let imageViewComponent2 = ImageViewComponent(layoutAttributes: [.centered],preferedViewSize: CGSize(width: 300, height: 300))
    imageViewComponent2.image = #imageLiteral(resourceName: "bear1")
    let imageViewComponent3 = ImageViewComponent(layoutAttributes: [.stackable(columns:2)],preferedViewSize: CGSize(width: 300, height: 400))
    imageViewComponent3.image = #imageLiteral(resourceName: "bear2")
    let imageViewComponent4 = ImageViewComponent(layoutAttributes: [.stackable(columns:2)],preferedViewSize: CGSize(width: 300, height: 500))
    imageViewComponent4.image = #imageLiteral(resourceName: "bear2")
    let imageViewComponent5 = ImageViewComponent(layoutAttributes: [.stackable(columns:2)],preferedViewSize: CGSize(width: 300, height: 200))
    imageViewComponent5.image = #imageLiteral(resourceName: "bear2")
    //CREATING BUTTON COMPONENT
    let button = { _ -> UIButton in
      let button = UIButton()
      button.setTitle(" Fight ", for: .normal)
      button.setTitleColor(.black, for: .normal)
      button.layer.cornerRadius = 5
      return button
    }()
    button.sizeToFit()
    let buttonComponent = button.asComponent
    buttonComponent.delegate = self
    buttonComponent.layoutAttributes = [.centered,.padding(top: 3, bottom: 3, left: 0, right: 0)]
    
    let button2 = { _ -> UIButton in
      let button = UIButton()
      button.setTitle("Run away", for: .normal)
      button.setTitleColor(.black, for: .normal)
      button.layer.cornerRadius = 5
      return button
    }()
    button2.sizeToFit()
    let buttonComponent2 = button2.asComponent
    buttonComponent2.delegate = self
    buttonComponent2.layoutAttributes = [.centered, .padding(top: 3, bottom: 3, left: 3, right: 3)]
    
    let button3 = { _ -> UIButton in
      let button = UIButton()
      button.setTitle("Wave hand", for: .normal)
      button.setTitleColor(.black, for: .normal)
      button.layer.cornerRadius = 5
      return button
    }()
    button3.sizeToFit()
    let buttonComponent3 = button3.asComponent
    buttonComponent3.delegate = self
    buttonComponent3.layoutAttributes = [.centered,.padding(top: 3, bottom: 3, left: 3, right: 3)]
    //CREATING LABELS
    let label = { _ -> UILabel in
      let label = UILabel()
      label.text = "Grizzly bear"
      label.textAlignment = .center
      return label
    }()
    label.sizeToFit()
    let labelViewComponent = label.asComponent
    labelViewComponent.layoutAttributes = [.centered]
    //CREATING LABEL 2
    let label2 = { _ -> UILabel in
      let label = UILabel()
      label.text = "Live in North America region"
      label.textAlignment = .center
      return label
    }()
    label2.sizeToFit()
    let priceViewComponent = label2.asComponent
    priceViewComponent.layoutAttributes = [.centered]
    
    
    let stackViewComponent2 = StackViewComponent([buttonComponent,
                                                  buttonComponent2,
                                                  buttonComponent3],
                                                 layoutAttributes: [.centered],
                                                 preferedViewSize: CGSize(width: 300, height: 50),
                                                 subviewDelegate: HorizontalSubviewLayout())
    let stackViewComponent = StackViewComponent([imageViewComponent2,
                                                 labelViewComponent,
                                                 priceViewComponent,
                                                 stackViewComponent2],
                                                layoutAttributes: [.padding(top: 10, bottom: 10, left: 10, right: 10),
                                                                   .centered],
                                                preferedViewSize: CGSize(width: 300, height: 300))
    
    components = [stackViewComponent, imageViewComponent3, imageViewComponent4, imageViewComponent5]

    _ = collectionView.components.append(contentsOf: components)
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    print(textField.text ?? "")
    return true
  }
  
  func touchUpInside(_ sender: UIButton){
  }
  
  func touchDown(_ sender: UIButton){
  }
  
  func webViewDidFinishLoad(_ webView: UIWebView) {
//    components[3].preferedViewSize = webView.scrollView.contentSize
    collectionView.reloadData()
  }

}

