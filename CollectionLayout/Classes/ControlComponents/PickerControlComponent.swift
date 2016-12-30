//
//  PickerControlComponent.swift
//  Pods
//
//  Created by JMango on 12/28/16.
//
//

import UIKit

public protocol PickerViewComponentDelegate {
  var componentsNumber : Int { get set }
  var rowsNumber : ((Int) -> (Int)) { get set }
  func didSelectRow(row: Int, inComponent component: Int)
  func title(forRow row: Int, inComponent component: Int) -> String
}

public class SelectOneControlComponent : PickerViewComponentDelegate {
  internal var interface : SelectOneViewComponent?
  public var componentsNumber: Int = 1
  public var rowsNumber: ((Int) -> (Int))
  var options: [String]
  public var selectedOption : String? {
    didSet {
      if let selectedOption = selectedOption {
        interface?.button.setTitle(selectedOption, for: .normal)
      }
    }
  }
  
  public init(_ options:[String]){
    rowsNumber = { _ in return options.count }
    self.options = options
  }
  
  public func set(interface: SelectOneViewComponent){
    self.interface = interface
    interface.button.setTitle(options[0], for: .normal)
  }
  
  public func title(forRow row: Int, inComponent component: Int) -> String {
    return options[row]
  }
  
  public func didSelectRow(row: Int, inComponent component: Int) {
    selectedOption = options[row]
  }
}
