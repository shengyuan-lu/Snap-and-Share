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
            
            let device = AVCaptureDevice.default(.builtInTelephotoCamera, for: .video, position: .back)
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
    
    func takePicture() {
        
        DispatchQueue.global(qos: .background).async {
            
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
        
        }
        
        
    }
    
    func retake() {
        
        DispatchQueue.global(qos: .background).async {
            
            self.session.startRunning()
            
            DispatchQueue.main.async {
                
                withAnimation {
                    self.isTaken = false
                }
                
                self.imageToSave = nil
                
            }
            
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
        
        print("Pic taken")
        
        self.session.stopRunning()
        
        self.isTaken = true
        
        let croppedImage = cropImageToSquare(image: capturedImage)
        
        // Save Image
        self.imageToSave = croppedImage
    }
    
}

func cropImageToSquare(image: UIImage) -> UIImage? {
    var imageHeight = image.size.height
    var imageWidth = image.size.width

    if imageHeight > imageWidth {
        imageHeight = imageWidth
    }
    else {
        imageWidth = imageHeight
    }

    let size = CGSize(width: imageWidth/1.5, height: imageWidth/1.5)

    let refWidth: CGFloat = CGFloat(image.cgImage!.width)
    let refHeight: CGFloat = CGFloat(image.cgImage!.height)

    let x = (refWidth - size.width) / 2
    let y = (refHeight - size.height) / 2

    let cropRect = CGRect(x: x-150, y: y, width: size.height, height: size.width)
    if let imageRef = image.cgImage!.cropping(to: cropRect) {
        return UIImage(cgImage: imageRef, scale: 0, orientation: image.imageOrientation)
    }

    return nil
}
