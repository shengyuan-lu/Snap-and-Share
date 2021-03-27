import Foundation

public protocol CameraViewDelegate {
    func cameraAccessGranted()
    func cameraAccessDenied()
    func noCameraDetected()
    func cameraSessionStarted()
}
