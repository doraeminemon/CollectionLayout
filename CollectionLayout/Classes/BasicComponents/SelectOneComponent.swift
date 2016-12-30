//
//  SelectOneComponent.swift
//  Pods
//
//  Created by JMango on 12/28/16.
//
//

import UIKit

public class SelectOneViewComponent : NSObject, UIPickerViewDataSource, UIPickerViewDelegate, ViewComponent, BasicComponent {
  public var layoutAttributes: [LayoutAttribute]
  public var preferedViewSize: CGSize
  public var view: UIView = { _ -> UIButton in
    let button = UIButton()
    button.backgroundColor = .white
    button.setTitle("Missing model", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.setTitleColor(.gray, for: .disabled)
    return button
  }()
  var pickerView : UIPickerView?
  var button : UIButton {
    return view as! UIButton
  }
  
  public var delegate : PickerViewComponentDelegate?
  
  public init(layoutAttributes: [LayoutAttribute] = [.fullWidth], preferedViewSize : CGSize = CGSize(width: 200, height: 50)){
    self.layoutAttributes = layoutAttributes
    self.preferedViewSize = preferedViewSize
    super.init()
    button.addTarget(self, action: #selector(touchedUpInside(_:)), for: .touchUpInside)
  }
  
  func touchedUpInside(_ sender: UIButton){
    let topView = view.topView()
    pickerView = UIPickerView(frame: CGRect(origin: CGPoint(x:0, y: topView.frame.height * 0.6), size: CGSize(width: topView.frame.width, height: 0)))
    pickerView?.isOpaque = true
    pickerView?.backgroundColor = .white
    pickerView?.clipsToBounds = true
    pickerView?.delegate = self
    pickerView?.dataSource = self
    topView.addSubview(pickerView!)
    UIView.animate(withDuration: 0.5){
      self.pickerView?.frame = CGRect(origin: CGPoint(x:0, y: topView.frame.height * 0.6), size: CGSize(width: topView.frame.width, height: topView.frame.height * 0.4))
    }
  }
  
  public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    delegate?.didSelectRow(row: row, inComponent: component)
    let origin = view.convert(view.frame.origin, to: nil)
    UIView.animate(withDuration: 0.5, animations: {
      self.pickerView?.frame = CGRect(origin: origin, size: CGSize(width: self.pickerView!.frame.width, height: self.preferedViewSize.height))
    }, completion: { _ in
      pickerView.removeFromSuperview()
    })
  }
  
  public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return delegate?.rowsNumber(component) ?? 0
  }
  
  public func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return delegate?.componentsNumber ?? 0
  }
  
  public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return delegate?.title(forRow: row, inComponent: component)
  }
  
}

