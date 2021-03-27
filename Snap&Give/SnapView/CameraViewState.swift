import Foundation
import SwiftUI
import UIKit

public class CameraState : NSObject, ObservableObject {
    @Published public var capturedImage : UIImage?
    @Published public var capturedImageError : Error?
}
