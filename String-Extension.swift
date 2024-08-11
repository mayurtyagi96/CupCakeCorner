//
//  String-Extension.swift
//  CupCakeCorner
//
//  Created by Mayur on 11/08/24.
//

import Foundation

extension String{
    mutating func trimed() -> String{
        self = trimmingCharacters(in: .whitespacesAndNewlines)
        return self
    }
}
