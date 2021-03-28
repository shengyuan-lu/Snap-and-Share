//
//  FoodList.swift
//  SnapShare
//
//  Created by Shengyuan Lu on 3/28/21.
//

import Foundation
import SwiftUI

class FoodList: ObservableObject {
    @Published var foodDict = [String : UIImage]()
}
