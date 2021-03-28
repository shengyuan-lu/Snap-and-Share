import SwiftUI
import UIKit
import AVFoundation

class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    
    @Published var alert = false
    
    @Published var output = AVCapturePhotoOutput()
    @Published var preview: AVCaptureVideoPreviewLayer!
    
    @Published var imageToSave: UIImage?
    @Published var isRecognized = false
    
    func check() {
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        
        case .authorized:
            setUp()
            
            return
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (authorized) in
                if authorized {
                    self.setUp()
                }
            }
            
        case .denied:
            self.alert.toggle()
            
            return
            
        default:
            return
        }
    }
    
    func setUp() {
        
        do {
            self.session.beginConfiguration()
            
            let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            let input = try AVCaptureDeviceInput(device: device!)
            
            if self.session.canAddInput(input) {
                self.session.addInput(input)
            }
            
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func takePic() {
        
        self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
        
        
        self.session.stopRunning()
        
        DispatchQueue.main.async {
            withAnimation{
                self.isTaken.toggle()
            }
        }
        
    }
    
    func retake() {
        
        
        self.session.startRunning()
        
        DispatchQueue.main.async {
            
            withAnimation {
                self.isTaken.toggle()
            }
            
            self.imageToSave = nil
        }
        
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        // Check if there is any error in capturing
        guard error == nil else {
            print("Fail to capture photo: \(String(describing: error))")
            return
        }
        
        // Check if the pixel buffer could be converted to image data
        guard let imageData = photo.fileDataRepresentation() else {
            print("Fail to convert pixel buffer")
            return
        }
        
        // Check if UIImage could be initialized with image data
        guard let capturedImage = UIImage.init(data: imageData , scale: 1.0) else {
            print("Fail to convert image data to UIImage")
            return
        }
        
        // Save Image
        self.imageToSave = capturedImage
        print(imageToSave!)
    }
    
}
