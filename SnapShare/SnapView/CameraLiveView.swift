import SwiftUI
import UIKit
import AVFoundation

struct CameraLiveView: UIViewRepresentable {
    
    @ObservedObject var cameraModel: CameraModel
    
    func makeUIView(context: Context) ->  UIView {
        
        let view = UIView(frame: UIScreen.main.bounds)
        
        cameraModel.preview = AVCaptureVideoPreviewLayer(session: cameraModel.session)
        cameraModel.preview.frame = view.frame
        
        cameraModel.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(cameraModel.preview)
        
        cameraModel.session.startRunning()
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
