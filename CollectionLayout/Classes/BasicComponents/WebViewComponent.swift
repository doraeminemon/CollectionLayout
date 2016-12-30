//
//  WebViewComponent.swift
//  Pods
//
//  Created by JMango on 12/28/16.
//
//

import UIKit

public class WebViewComponent : ViewComponent {
  public var layoutAttributes: [LayoutAttribute]
  public var preferedViewSize: CGSize
  public var view: UIView = { _ -> UIWebView in
    let webView = UIWebView()
    return webView
  }()
  
  var webView: UIWebView {
    return view as! UIWebView
  }
  
  public var url : URL? {
    didSet {
      if let url = url {
        webView.loadRequest(URLRequest(url: url))
      }
    }
  }
  
  public var delegate : UIWebViewDelegate? {
    didSet {
      webView.delegate = delegate
    }
  }
  
  public init(layoutAttributes: [LayoutAttribute] = [.fullWidth], preferedViewSize: CGSize = CGSize(width: 300, height: 300)){
    self.layoutAttributes = layoutAttributes
    self.preferedViewSize = preferedViewSize
  }
}



