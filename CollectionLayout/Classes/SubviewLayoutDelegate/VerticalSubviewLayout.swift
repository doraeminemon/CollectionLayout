//
//  VerticalSubviewLayout.swift
//  Pods
//
//  Created by JMango on 12/29/16.
//
//

import UIKit

public class VerticalSubviewLayout : SubviewLayoutDelegate {
  var verticalOffset : CGFloat = 0
  var horizontalOffset: CGFloat = 0
  var columnVerticalMin : [CGFloat] = []
  var columnHorizontalOffset : [CGFloat] = []
  
  public func contentViewFrameSize(components: [ViewComponent], superViewSize: CGSize) -> CGSize {
    let maxComponentsWidth = components.map{ $0.preferedViewSize.width }.max()!
    let width = (superViewSize.width > maxComponentsWidth) ? superViewSize.width : maxComponentsWidth
    return CGSize(width: width , height: verticalOffset)
  }
  
  public func nextFrame(component: ViewComponent, superViewSize: CGSize) -> CGRect {
    let cpmAttr = component.layoutAttributes
    
    var cellOrigin = CGPoint(x: horizontalOffset, y: verticalOffset)
    var cellSize = component.preferedViewSize
    
    //DON'T ALLOW STACKABLE COMPONENT TO GO ALONG WITH OTHER NORMAL ELEMENTS
    for attribute in cpmAttr {
      if case .stackable(columns: let columns) = attribute {
        if columnVerticalMin.count == 0 {
          columnVerticalMin = Array<CGFloat>(repeating: verticalOffset, count: columns)
          for i in 0...columns-1 {
            columnHorizontalOffset.append( CGFloat(i) * (superViewSize.width / CGFloat(columns) ) )
          }
        }
        let minColumn : Int = columnVerticalMin.index(of: columnVerticalMin.min()!)!
        
        cellOrigin = CGPoint(x: columnHorizontalOffset[minColumn], y: columnVerticalMin[minColumn])
        cellSize.width = superViewSize.width / CGFloat(columns)
        columnVerticalMin[minColumn] += cellSize.height
        
        verticalOffset = columnVerticalMin.max()!
        horizontalOffset = 0
        return CGRect(origin: cellOrigin, size: cellSize)
      }
    }
    cellOrigin = CGPoint(x: horizontalOffset, y: verticalOffset)
    cellSize = component.preferedViewSize
    //ONLY ONE CAN HAPPEN, WITH FULLWIDTH BEING PRIORITIZED
    if cpmAttr.contains(where: {$0.matchCase(.fullWidth)}) {
      cellSize.width = superViewSize.width
    } else if cpmAttr.contains(where: {$0.matchCase(.halfWidth)}){
      cellSize.width = superViewSize.width / 2
    }
    if cpmAttr.contains(where: {$0.matchCase(.centered)}){
      cellOrigin.x = ( superViewSize.width - cellSize.width ) / 2
      cpmAttr.forEach{ (attribute) in
        if case .padding(top: let top, bottom: let bottom, left: let left, right: let right) = attribute {
          cellOrigin.y += top
          verticalOffset += bottom
        }
      }
    } else if cpmAttr.contains(where: {$0.matchCase(.leftAlign)}) {
      cellOrigin.x = 0
      cpmAttr.forEach{ (attribute) in
        if case .padding(top: let top, bottom: let bottom, left: let left, right: let right) = attribute {
          cellOrigin.y += top
          verticalOffset += bottom
        }
      }
    } else if cpmAttr.contains(where: {$0.matchCase(.rightAlign)}){
      cellOrigin.x = superViewSize.width - cellSize.width
      cpmAttr.forEach{ (attribute) in
        if case .padding(top: let top, bottom: let bottom, left: let left, right: let right) = attribute {
          cellOrigin.y += top
          verticalOffset += bottom
        }
      }
    } else {
      cpmAttr.forEach { attribute in
        if case .padding(top: let top, bottom: let bottom, left: let left, right: let right) = attribute {
          cellOrigin.x += left
          cellOrigin.y += top
          //                  horizontalOffset += right
          verticalOffset += bottom
        }
      }
    }
    
    let finalFrame = CGRect(origin: cellOrigin, size: cellSize)
    verticalOffset += cellSize.height
    return finalFrame
  }
}
