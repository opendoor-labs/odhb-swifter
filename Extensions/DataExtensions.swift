//
//  DataExtensions.swift
//
//  Created by Rok Gregorič
//  Copyright © 2018 Rok Gregorič. All rights reserved.
//

import Foundation

extension Data {
  var utf8string: String? {
    return String(data: self, encoding: .utf8)
  }
  
  var hexString: String {
    return map { String(format: "%02.2hhx", $0) }.joined()
  }
  
  init?(hexString: String) {
    let len = hexString.count / 2
    var data = Data(capacity: len)
    var i = hexString.startIndex
    for _ in 0..<len {
      let j = hexString.index(i, offsetBy: 2)
      let bytes = hexString[i..<j]
      if var num = UInt8(bytes, radix: 16) {
        data.append(&num, count: 1)
      } else {
        return nil
      }
      i = j
    }
    self = data
  }

  var image: Image? {
    return Image(data: self)
  }

  var base64ImageString: String {
    return "data:image/png;base64,\(base64EncodedString(options:.lineLength64Characters))"
  }

  func array<T>(of type: T.Type) -> [T] {
    let v = withUnsafeBytes { $0.load(as: type) }
    var arr = Array<T>(repeating: v, count: count/MemoryLayout<T>.stride)
    _ = arr.withUnsafeMutableBytes { copyBytes(to: $0) }
    return arr
  }

  var safeString: String? {
    array(of: CChar.self).withUnsafeBufferPointer { String(cString: $0.baseAddress!) }.components(separatedBy: .controlCharacters).joined()
  }
}
