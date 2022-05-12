//
//  CGRectExtensions.swift
//
//  Created by Rok Gregorič
//  Copyright © 2021 Rok Gregorič. All rights reserved.
//

import UIKit

extension CGRect {
  @nonobjc
  var width: CGFloat {
    get { size.width }
    set { size.width = newValue }
  }

  @nonobjc
  var height: CGFloat {
    get { size.height }
    set { size.height = newValue }
  }

  @nonobjc
  var x: CGFloat {
    get { origin.x }
    set { origin.x = newValue }
  }

  @nonobjc
  var y: CGFloat {
    get { origin.y }
    set { origin.y = newValue }
  }

  @nonobjc
  var center: CGPoint {
    get { CGPoint(x: midX, y: midY) }
    set { origin = CGPoint(x: newValue.x - width/2, y: newValue.y - height/2) }
  }

  func inset(all val: CGFloat) -> CGRect {
    inset(by: UIEdgeInsets(top: val, left: val, bottom: val, right: val))
  }

  func outset(all val: CGFloat) -> CGRect {
    inset(all: -val)
  }

  func outset(by insets: UIEdgeInsets) -> CGRect {
    inset(by: UIEdgeInsets(top: -insets.top, left: -insets.left, bottom: -insets.bottom, right: -insets.right))
  }
}
